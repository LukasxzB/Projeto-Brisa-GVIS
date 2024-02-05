///
/// [AppString] é uma classe que contém todas as strings e textos utilizadas
/// dentro do aplicativo.
///

class AppString {
  static String get noTitle => ' ';
  static String get deleteAllData => 'Deletar todos os dados salvos';
  static String get deletingAllData =>
      'Removendo todos os dados armazenados... Isso pode demorar alguns minutos!';
  static String get deleteAllDataFailed =>
      'Ocorreu um erro ao remover os dados!';
  static String get deletedAllData =>
      'Todos os dados armazenados foram removidos!';
  static String get loadingApp => 'O aplicativo está inicializando...';
  static String get demoServerName => 'Servidor de demonstração';
  static String get viewEvaluation => 'Visualizar avaliação';
  static String get questionnaire => 'Questionário';
  static String get unknown => 'Desconhecido';
  static String get connected => 'Conectado';
  static String get disconnected => 'Desconectado';
  static String get verifing => 'Verificando...';
  static String get termsOfUse => 'Termos de uso';
  static String get appTitle => 'APP G-VIS';
  static String get appFullTitle => 'G-VIS - Gestão de Vigilância Sanitária';
  static String get appShortTitle => 'G-VIS';
  static String get welcomeToApp => 'Sejam bem vindo(as) ao novo aplicativo!';
  static String get developedBy => 'Desenvolvido por Inovadora Sistemas';
  static String get selectCity => 'Selecione o municipio';
  static String get next => 'Avançar';
  static String get login => 'Entrar';
  static String get logoff => 'Sair';
  static String get attention => 'Atenção!';
  static String get insertUser => 'Insira o usuário';
  static String get insertPassword => 'Insira a senha';
  static String get noSyncedData => 'Sem sincronização';
  static String get loading => 'Carregando...';
  static String get whatToImport => 'O que deseja importar?';
  static String get importData => 'Importar dados';
  static String get importEvaluation => 'Importar avaliações';
  static String get importingEvaluations => 'Importando avaliações...';
  static String get importEstablishment => 'Importar estabelecimentos';
  static String get close => 'Fechar';
  static String get cancel => 'Cancelar';
  static String get exportData => 'Exportar dados';
  static String get evaluations => 'Avaliações';
  static String get establishments => 'Estabelecimentos';
  static String get autoAvulso => 'Auto-avulso';
  static String get exportHistory => 'Histórico de exportação';
  static String get exports => 'Exportações';
  static String get loginError =>
      'O usuário e/ou senha estão incorretos! Por favor, verifique os dados e tente novamente!';
  static String get back => 'Voltar';
  static String get selectAll => 'Marcar tudo';
  static String get unselectAll => 'Desmarcar tudo';
  static String get emptyImportEvaluationList =>
      'Nenhuma nova avaliação encontrada!';
  static String get emptyEvaluationList => 'Nenhuma avaliação encontrada!';
  static String get emptyEvaluationImportList =>
      'Nenhuma nova avaliação disponível para importação!';
  static String get emptyEstablishmentImportList =>
      'Nenhum novo estabelecimento disponível para importação!';
  static String get tryAgain => 'Tentar novamente';
  static String get noInformation => 'Sem informação';
  static String get createSummon => 'Criar intimação';
    static String get summon => 'Intimação';   
  static String get createEstablishment => 'Adicionar estabelecimento';
  static String get openQuestionnaire => 'Abrir questionário';
  static String get loadingQuestionnaire => 'Carregando questionário...';
  static String get loadingQuestionnaireFailed =>
      'Ocorreu um erro ao carregar o questionário! Por favor, tente novamente.';
  static String get saveAnswers => 'Salvar respostas';
  static String get references => 'Referências';
  static String get ok => 'OK';

  static String get searchEstablishment =>
      'Pesquisar estabelecimento pelo nome ou documento';
  static String get searchEvaluation =>
      'Pesquisar avaliação pelo título, nome ou documento do estabelecimento';
  static String get failedDatabaseInitialization =>
      'Ocorreu um erro ao inicializar o banco de dados.';
  static String get appCrashedAtInitializationTitle =>
      'Ocorreu um erro fatal ao inicializar o aplicativo!';
  static String get emptyEstablishmentList =>
      'Nenhum estabelecimento disponível!';
  static String get loadingEstablishmentList =>
      'Carregando a lista de estabelecimentos... Isto pode demorar alguns minutos!';
  static String get failedToLoadEstablishmentList =>
      'Ocorreu um erro ao carregar a lista de estabelecimentos! Por favor, tente novamente em alguns instantes.';
  static String get failedToLoadEvaluationList =>
      'Ocorreu um erro ao carregar a lista de avaliações! Por favor, tente novamente em alguns instantes.';
  static String get loadingEvaluationList =>
      'Carregando lista de avaliações... Isto pode demorar um pouco.';
  static String get failedToImportEvaluation =>
      'Devido a um erro, apenas algumas avaliações puderam ser importadas! Por favor, tente novamente em alguns instantes.';
  static String get newEstablishment => 'Novo estabelecimento';

  static String appVersion(String version) => 'Versão $version';
  static String lastSyncedAt(String date) => 'Sincronizado em: $date';
  static String fiscalName(String name) => '<bold>Fiscal</bold>: $name';
  static String cityName(String city) => '<bold>Município</bold>: $city';
  static String importEvaluationTitle(String title) => ' $title';
  static String establishmentName(String name) =>
      '<bold>Estabelecimento</bold>: $name';
  static String establishmentCity(String city) =>
      '<bold>Município</bold>: $city';
  static String establishmentAddress(String address) =>
      '<bold>Logradouro</bold>: $address';
  static String establishmentAddressNumber(String number) =>
      '<bold>Número</bold>: $number';
  static String establishmentNeighboorhood(String neighboorhood) =>
      '<bold>Bairro</bold>: $neighboorhood';
  static String establishmentReason(String reason) =>
      '<bold>Razão social</bold>: $reason';
  static String establishmentDocumentBold(String document) =>
      '<bold>CNPJ/CPF</bold>: $document';
  static String establishmentDocument(String document) => 'CNPJ/CPF: $document';
  static String establishmentResponsible(String responsible) =>
      '<bold>Responsável</bold>: $responsible';
  static String noEvaluationTitle(int id) => 'Avaliação #$id';
  static String establishmentListImported(int qnt) =>
      '$qnt estabelecimentos importados com sucesso!';
  static String importEvaluationCount(int qnt) => 'Importar $qnt avaliações';
  static String importedEvaluationCount(int qnt) =>
      'Quantidade de avaliações importadas com sucesso: $qnt';
  static String importingEvaluationCount(int remainingCount) =>
      'Quantidade de avaliações restantes: $remainingCount';
  static String importedEvaluationCountWithError(
          int successCount, int errorCount) =>
      '$successCount avaliações foram importadas com sucesso, porém, $errorCount avaliações não puderam ser importadas devido a um erro!';
  static String evaluationSummon(String text) =>
      '<bold>Avaliação/intimação</bold>: $text';
  static String exportHistoryItemTitle(int qnt) =>
      '$qnt resposta(s) exportadas';
  static String questionnaireChapter(int index, String chapter) =>
      'Capítulo $index: $chapter';
  static String questionnaireReferenceScope(String scope) =>
      '<bold>Âmbito</bold>: $scope';
  static String questionnaireReferenceType(String type) =>
      '<bold>Tipo</bold>: $type';
  static String questionnaireReferenceYear(String year) =>
      '<bold>Ano</bold>: $year';
  static String questionnaireReferenceNumber(String number) =>
      '<bold>Número</bold>: $number';
  static String questionnaireReferenceText(String text) =>
      '<bold>Referência</bold>: $text';
}
