abstract class DatabaseOperations<T> {
  // CRUD
  // create
  Future<int> create(T object);

  // read
  Future<List<T>> read();

  Future<T?> show(int id);

  // update(T object);
  Future<bool> update(T object);

  // delete
  Future<bool> delete(int id);
}
