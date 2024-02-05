import 'package:flutter/foundation.dart';
import 'package:gvis_mobilidade/src/utils/app_database/repository/questionnaire_repository.dart';
import 'package:gvis_mobilidade/src/utils/app_database/repository/evaluation_repository.dart';
import 'package:gvis_mobilidade/src/utils/app_database/repository/establishment_repository.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

///
/// A classe [AppDatabase] é responsável por inicializar o banco de dados da aplicação,
/// assim como criar as tabelas necessárias para o funcionamento da mesma.
///
/// Além disso, a classe [AppDatabase] é responsável por fornecer os repositórios
/// necessários para realizar as operações de CRUD no banco de dados.
/// Qualquer leitura, inserção, atualização ou remoção de dados do banco de dados
/// deve ser feita através dos repositórios fornecidos pela classe [AppDatabase].
///

class AppDatabase {
  AppDatabase._();

  static late Database _database;
  static const String _databasePath = 'app_gvis.db';

  ///
  /// [initializeDatabase] é responsável por inicializar o banco de dados da aplicação.
  /// Caso o banco de dados não exista, o mesmo será criado.
  /// Caso o banco de dados já exista, o mesmo será aberto.
  /// Caso ocorra algum erro, a função irá retornar false.
  ///
  static Future<bool> initializeDatabase() async {
    String url = join(await getDatabasesPath(), _databasePath);
    debugPrint('url banco: $url');
    _database = await openDatabase(
      url,
      onConfigure: _onConfigure,
      onCreate: _onCreate,
      version: 1,
    );

    return _database.isOpen;
  }

  static Future<bool> deleteEverything() async {
    debugPrint('DELETANDO TODOS OS DADOS DO BANCO DE DADOS!');
    await _deleteTable('avaliacao');
    await _deleteTable('estabelecimento');
    await _deleteTable('questionario');
    await _deleteTable('questionario_capitulo');
    await _deleteTable('questionario_categoria');
    await _deleteTable('questionario_pergunta');
    await _deleteTable('questionario_referencia');
    await _deleteTable('questionario_referencias_pergunta');
    await _deleteTable('questionario_comprovacao');
    await _deleteTable('questionario_comprovacao_pergunta');
    await _deleteTable('questionario_opcao_pergunta');
    await _deleteTable('questionario_conjunto_resposta');
    await _deleteTable('questionario_resposta_unitaria');
    return true;
  }

  static Future<void> _deleteTable(String tableName) async {
    debugPrint('deletando tudo da tabela $tableName');
    await _database.delete(tableName);
  }

  static Future<void> closeDatabase() async {
    await _database.close();
  }

  static Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS avaliacao(codigoAvaliacao INTEGER PRIMARY KEY,
        dataInicio TEXT, dataFim TEXT, codigoStatusAvaliacao INTEGER,
        veiculo TEXT, nomeAvaliado TEXT, codigoQuestionario INTEGER NOT NULL,
        dataVistoria TEXT, codigoAvaliado INT, dataSolicitacaoVistoria TEXT,
        dataDesejadaVistoria TEXT, updateAt TEXT, codigoUsuarioCriador INT,
        codigoUsuarioAvaliador INT, codigousuarioVistoriador INT, codigousuarioAlterador INT,
        tituloAvaliacao TEXT, avaliacoesResposta TEXT, flagVisivelAvaliado INTEGER,
        flagHaveraVistoria INTEGER, avaliadoTipo INTEGER, nroProtocolo TEXT,
        estabelecimento_cep TEXT, estabelecimento_cidade TEXT, estabelecimento_bairro TEXT,
        estabelecimento_logradouro TEXT, estabelecimento_cpfCnpj TEXT, estabelecimento_nomeRazaoSocial TEXT,
        estabelecimento_proprietarioResponsavel TEXT, estabelecimento_numeroEndereco TEXT,
        estabelecimento_siglaUf TEXT, estabelecimento_inscricaoMunicipal INTEGER,
        estabelecimento_inscricaoEstadual INTEGER, estabelecimento_id INTEGER,
         estabelecimento_atividades TEXT, estabelecimento_nomeFantasia TEXT);
    );''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS estabelecimento(email TEXT, cep TEXT, cidade TEXT, bairro TEXT,
      logradouro TEXT, complemento TEXT, cpfCnpj TEXT, inscricaoEstadual INTEGER,
      nomeFantasia TEXT, inscricaoMunicipal INTEGER, numeroEndereco TEXT, dataAlteracao INTEGER,
      tipoPessoa TEXT, latitude REAL, longitude REAL, fone TEXT, razaoSocial TEXT, siglaUf TEXT,
      proprietarioResponsavel TEXT, id INTEGER PRIMARY KEY, atividades TEXT);
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS questionario(
        codigoQuestionario INTEGER PRIMARY KEY, observacoes TEXT,
        nomeQuestionario TEXT, codigoStatus INTEGER,
        motivoAtivo TEXT, dataAlteracaoAtivo TEXT);
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS questionario_capitulo(
        codigoCapitulo INTEGER PRIMARY KEY, ordemCapitulo INTEGER,
        nomeCapitulo TEXT, codigoQuestionario INTEGER,
        FOREIGN KEY(codigoQuestionario) REFERENCES questionario(codigoQuestionario) ON DELETE CASCADE);
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS questionario_categoria(
        codigoCategoria INTEGER PRIMARY KEY, ordemCategoria INTEGER,
        nomeCategoria TEXT, codigoCapitulo INTEGER,
        FOREIGN KEY(codigoCapitulo) REFERENCES questionario_capitulo(codigoCapitulo) ON DELETE CASCADE);
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS questionario_pergunta(
        codigoPergunta INTEGER PRIMARY KEY, texto TEXT, numeroPergunta INTEGER,
        codigoNivel INTEGER, codigoTipoPergunta INTEGER, referenciaHtml TEXT,
        flagArquivoDigital INTEGER, ordemPergunta INTEGER, codigoCategoria INTEGER,
        FOREIGN KEY(codigoCategoria) REFERENCES questionario_categoria(codigoCategoria) ON DELETE CASCADE);
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS questionario_referencia(
        codigoReferencia INTEGER PRIMARY KEY, descricaoReferencia TEXT,
        descricaoItemReferencia TEXT, nomeNumeroReferencia TEXT,
        tipoReferencia TEXT, tipoAmbitoReferencia INTEGER,
        anoReferencia INTEGER);
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS questionario_referencias_pergunta(
        codigoPergunta INTEGER, codigoReferencia INTEGER,
        FOREIGN KEY(codigoPergunta) REFERENCES questionario_pergunta(codigoPergunta) ON DELETE CASCADE,
        FOREIGN KEY(codigoReferencia) REFERENCES questionario_referencia(codigoReferencia),
        UNIQUE(codigoPergunta, codigoReferencia));
    ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS questionario_comprovacao(
          id INTEGER PRIMARY KEY, descricao TEXT);
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS questionario_comprovacao_pergunta(
        codigoPergunta INTEGER, id INTEGER,
        FOREIGN KEY(codigoPergunta) REFERENCES questionario_pergunta(codigoPergunta) ON DELETE CASCADE,
        FOREIGN KEY(id) REFERENCES questionario_comprovacao(id),
        UNIQUE(codigoPergunta, id));
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS questionario_opcao_pergunta(
        codigoPerguntaOpcao INTEGER PRIMARY KEY, descricaoPerguntaOpcao TEXT,
        orientacaoPerguntaOpcao TEXT, pontosPerguntaOpcao REAL,
        codigoPergunta INTEGER,
        FOREIGN KEY(codigoPergunta) REFERENCES questionario_pergunta(codigoPergunta) ON DELETE CASCADE);
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS questionario_conjunto_resposta (
        codigoAvaliacaoResposta INTEGER PRIMARY KEY, codigoPergunta INTEGER,
        observacaoAvaliacaoResposta TEXT, observacaoContraRespostaAvaliacaoResposta TEXT,
        pontuacaoObtidaAvaliacaoResposta REAL, flagConcordaAvaliacaoResposta INTEGER,
        FOREIGN KEY(codigoPergunta) REFERENCES questionario_pergunta(codigoPergunta) ON DELETE CASCADE);
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS questionario_resposta_unitaria(
        codigoResposta INTEGER PRIMARY KEY, codigoAvaliacaoResposta INTEGER,
        codigoRespostaPergunta INTEGER, flagContraResposta INTEGER,
        dtResposta TEXT,
        FOREIGN KEY(codigoAvaliacaoResposta) REFERENCES questionario_conjunto_resposta(codigoAvaliacaoResposta) ON DELETE CASCADE);
    ''');
  }

  static Batch createBatch() {
    return _database.batch();
  }

  static EvaluationRepository get evaluation =>
      EvaluationRepository(database: _database);

  static EstablishmentRepository get establishmnet =>
      EstablishmentRepository(database: _database);

  static QuestionnaireRepository get questionnaire =>
      QuestionnaireRepository(database: _database);
}
