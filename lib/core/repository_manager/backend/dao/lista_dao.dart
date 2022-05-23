import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/dao_utils.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/item_dao.dart';

class ListaDAO{

  final ItemDAO itemDAO = ItemDAO();

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
    String sql = DaoUtils.includeQueriesIntoSql('SELECT * FROM lista', query);
    sql += ' ORDER BY nmLista';
    return DaoUtils.convertToMutableList((await DAO.findRaw(sql))!);
  }
}