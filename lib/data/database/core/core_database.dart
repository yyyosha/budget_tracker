abstract class ICoreDatabase<T extends Object> {
  String get name;

  Future<List<T>> all();

  Future<T?> get(String id);

  Future<void> create(T model);

  Future<void> edit(T model);

  Future<void> delete(String id);
}