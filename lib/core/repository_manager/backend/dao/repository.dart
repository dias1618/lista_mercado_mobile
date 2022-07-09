abstract class Repository {
  Future<int> insert(data);
  Future<int> update(data);
  Future<int> delete(int id);
  Future<Map<dynamic, dynamic>?> get(int id);
  Future<List<Map<dynamic, dynamic>>?> find(Map<String, dynamic>? query);
}
