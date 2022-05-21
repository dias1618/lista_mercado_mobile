import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/dao.dart';

class ListaDAO{

  Future<int> insert(data) async {
    return await DAO.insert('lista', data);
  }

  Future<int> update(data) async {
    return await DAO.update('lista', data);
  }
  
  Future<int> delete(int id) async {
    return await DAO.delete('lista', id);
  }

  Future<Map<dynamic, dynamic>?> get(int id) async {
    return await DAO.get('lista', id);
  }

  Future<List<Map<dynamic, dynamic>>?> find(Map<String, dynamic>? query) async {
    return await DAO.find('lista', query);
  }
}