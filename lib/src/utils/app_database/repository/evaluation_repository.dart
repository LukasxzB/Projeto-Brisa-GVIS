import 'package:gvis_mobilidade/src/app_consts/database/app_database_tablename.dart';
import 'package:gvis_mobilidade/src/app_dto/evaluation/evaluation_dto.dart';
import 'package:gvis_mobilidade/src/utils/app_database/app_database.dart';
import 'package:gvis_mobilidade/src/utils/app_database/interfaces/app_repository.dart';
import 'package:sqflite/sqflite.dart';

///
/// [EvaluationRepository] é responsável por realizar as operações de CRUD
/// no banco de dados da tabela avaliacao.
///
/// A classe atual não deve ser instanciada, pois a mesma é utilizada pelo
/// [AppDatabase] e deverá ser utilizada por lá.
///
class EvaluationRepository implements AppRepository<EvaluationDTO> {
  static const String tableName = AppDatabaseTablename.evaluation;

  EvaluationRepository({required Database database}) : _database = database;
  final Database _database;

  @override
  Future<List<EvaluationDTO>> getAll() async {
    final List<Map<String, dynamic>> maps = await _database.query(tableName);

    return List.generate(maps.length, (i) {
      return EvaluationDTO.fromMap(maps[i]);
    });
  }

  @override
  Future<EvaluationDTO?> getById(int codigoQuestionario) async {
    final List<Map<String, dynamic>> maps = await _database.query(
      tableName,
      where: 'codigoQuestionario = ?',
      whereArgs: [codigoQuestionario],
    );

    if (maps.isEmpty) return null;
    return EvaluationDTO.fromMap(maps.first);
  }

  @override
  Future<bool> insertOrUpdate(EvaluationDTO evaluation) async {
    int rows = await _database.insert(
      tableName,
      evaluation.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return rows > 0;
  }

  @override
  void insertOrUpdateBatch(Batch batch, EvaluationDTO evaluation) async {
    batch.insert(
      tableName,
      evaluation.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<bool> deleteAll() async {
    int rows = await _database.delete(tableName);
    return rows > 0;
  }

  @override
  Future<bool> deleteById(int codigoQuestionario) async {
    int rows = await _database.delete(
      tableName,
      where: 'codigoQuestionario = ?',
      whereArgs: [codigoQuestionario],
    );

    return rows > 0;
  }

  @override
  void deleteByIdBatch(Batch batch, int codigoQuestionario) async {
    batch.delete(
      tableName,
      where: 'codigoQuestionario = ?',
      whereArgs: [codigoQuestionario],
    );
  }
}
