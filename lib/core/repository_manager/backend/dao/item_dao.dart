import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/dao.dart';

class ItemDAO{

  Future<int> insert(data) async {
    return await DAO.insert('item', data);
  }

  Future<int> update(data) async {
    return await DAO.update('item', data);
  }
  
  Future<int> delete(int id) async {
    return await DAO.delete('item', id);
  }

  Future<Map<dynamic, dynamic>?> get(int id) async {
    return await DAO.get('item', id);
  }

  Future<List<Map<dynamic, dynamic>>?> find(Map<String, dynamic>? query) async {
    return await DAO.find('item', query);
  }
}