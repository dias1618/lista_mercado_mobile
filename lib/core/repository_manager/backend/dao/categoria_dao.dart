import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/repository.dart';

class CategoriaDAO implements Repository {
  @override
  Future<int> insert(data) async {
    return await DAO.insert('categoria', data);
  }

  @override
  Future<int> update(data) async {
    return await DAO.update('categoria', data);
  }

  @override
  Future<int> delete(int id) async {
    return await DAO.delete('categoria', id);
  }

  @override
  Future<Map<dynamic, dynamic>?> get(int id) async {
    return await DAO.get('categoria', id);
  }

  @override
  Future<List<Map<dynamic, dynamic>>?> find(Map<String, dynamic>? query) async {
    return await DAO.find('categoria', query);
  }
}
