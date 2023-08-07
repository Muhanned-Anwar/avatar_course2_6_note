import 'package:avatar_course2_6_note/core/storage/local/database/database_provider.dart';

abstract class DatabaseOperations<T> {
  // CRUD
  // create
  Future<int> create(T object) async {
    DatabaseProvider databaseProvider = DatabaseProvider();
    DatabaseProvider databaseProvider2 = DatabaseProvider();
    DatabaseProvider databaseProvider3 = DatabaseProvider();
    DatabaseProvider databaseProvider4 = DatabaseProvider();
    DatabaseProvider databaseProvider5 = DatabaseProvider();
    return 0;
  }

  // read
  Future<List<T>> read();

  Future<T?> show(int id);

  // updateT object);
  Future<bool> update();

  // delete
  Future<bool> delete(int id);
}
