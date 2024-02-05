import 'package:gvis_mobilidade/src/app_consts/database/app_database_tablename.dart';
import 'package:gvis_mobilidade/src/app_dto/establishment/establishment_dto.dart';
import 'package:gvis_mobilidade/src/utils/app_database/app_database.dart';
import 'package:gvis_mobilidade/src/utils/app_database/interfaces/app_repository.dart';
import 'package:sqflite/sqflite.dart';

///
/// [EstablishmentRepository] é responsável por realizar as operações de CRUD
/// no banco de dados da tabela estabelecimento.
///
/// A classe atual não deve ser instanciada, pois a mesma é utilizada pelo
/// [AppDatabase] e deverá ser utilizada por lá.
///
class EstablishmentRepository implements AppRepository<EstablishmentDTO> {
  static const String tableName = AppDatabaseTablename.establishment;
  final Database _database;

  EstablishmentRepository({required Database database}) : _database = database;

  @override
  Future<List<EstablishmentDTO>> getAll() async {
    final List<Map<String, dynamic>> maps = await _database.query(tableName);

    return List.generate(maps.length, (i) {
      return EstablishmentDTO.fromMap(maps[i]);
    });
  }

  @override
  Future<bool> deleteAll() async {
    int rows = await _database.delete(tableName);
    return rows > 0;
  }

  @override
  Future<bool> deleteById(int id) async {
    int rows = await _database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    return rows > 0;
  }

  @override
  void deleteByIdBatch(Batch batch, int id) async {
    batch.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<EstablishmentDTO?> getById(int id) async {
    final List<Map<String, dynamic>> maps = await _database.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) return null;
    return EstablishmentDTO.fromMap(maps.first);
  }

  @override
  Future<bool> insertOrUpdate(EstablishmentDTO model) async {
    int rows = await _database.insert(
      tableName,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return rows > 0;
  }

  @override
  void insertOrUpdateBatch(Batch batch, EstablishmentDTO model) {
    batch.insert(
      tableName,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
