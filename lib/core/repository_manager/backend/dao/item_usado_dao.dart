import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/dao_utils.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/repository.dart';

class ItemUsadoDAO implements Repository {
  @override
  Future<int> insert(data) async {
    return await DAO.insert('item_usado', data);
  }

  @override
  Future<int> update(data) async {
    return await DAO.update('item_usado', data);
  }

  @override
  Future<int> delete(int id) async {
    return await DAO.delete('item_usado', id);
  }

  @override
  Future<Map<dynamic, dynamic>?> get(int id) async {
    return await DAO.get('item_usado', id);
  }

  @override
  Future<List<Map<dynamic, dynamic>>?> find(Map<String, dynamic>? query) async {
    String sql = DaoUtils.includeQueriesIntoSql(
        'SELECT A.* FROM item_usado A LEFT OUTER JOIN item B ON (A.itemId = B.id) ',
        query);
    return DaoUtils.convertToMutableList((await DAO.findRaw(sql))!);
  }
}
