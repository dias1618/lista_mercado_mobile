import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/dao_utils.dart';

class ItemUsadoDAO{

  Future<int> insert(data) async {
    return await DAO.insert('item_usado', data);
  }

  Future<int> update(data) async {
    return await DAO.update('item_usado', data);
  }
  
  Future<int> delete(int id) async {
    return await DAO.delete('item_usado', id);
  }

  Future<Map<dynamic, dynamic>?> get(int id) async {
    return await DAO.get('item_usado', id);
  }

  Future<List<Map<dynamic, dynamic>>?> find(Map<String, dynamic>? query) async {
    String sql = DaoUtils.includeQueriesIntoSql('SELECT * FROM item_usado', query);
    sql += ' ORDER BY itemId';
    return  DaoUtils.convertToMutableList((await DAO.findRaw(sql))!);
  }



}