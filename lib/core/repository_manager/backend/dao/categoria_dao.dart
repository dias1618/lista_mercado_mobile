import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/dao.dart';

class CategoriaDAO{

  Future<int> insert(data) async {
    return await DAO.insert('categoria', data);
  }

  Future<int> update(data) async {
    return await DAO.update('categoria', data);
  }
  
  Future<int> delete(int id) async {
    return await DAO.delete('categoria', id);
  }

  Future<Map<dynamic, dynamic>?> get(int id) async {
    return await DAO.get('categoria', id);
  }

  Future<List<Map<dynamic, dynamic>>?> find(Map<String, dynamic>? query) async {
    return await DAO.find('categoria', query);
  }
}