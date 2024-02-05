import 'package:gvis_mobilidade/src/utils/app_database/interfaces/app_repository_batch.dart';

abstract class AppRepository<T> implements AppRepositoryBatch<T> {
  Future<List<T?>> getAll();
  Future<bool> insertOrUpdate(T model);
  Future<bool> deleteAll();
}
