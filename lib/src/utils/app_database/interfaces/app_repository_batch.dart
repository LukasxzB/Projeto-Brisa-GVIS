import 'package:sqflite/sqflite.dart';

abstract class AppRepositoryBatch<T> {
  void insertOrUpdateBatch(Batch batch, T model);
  void deleteByIdBatch(Batch batch, int id);
  Future<T?> getById(int id);
  Future<bool> deleteById(int id);
}
