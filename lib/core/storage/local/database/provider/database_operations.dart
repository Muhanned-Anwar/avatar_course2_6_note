abstract class DatabaseOperations<T> {
  // CRUD
  // create
  Future<int> create(T object);

  // read
  Future<List<T>> read();

  Future<T?> show(int id);

  // updateT object);
  Future<bool> update();

  // delete
  Future<bool> delete(int id);
}
