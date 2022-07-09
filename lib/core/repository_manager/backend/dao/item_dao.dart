import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/dao_utils.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/repository.dart';

class ItemDAO implements Repository {
  @override
  Future<int> insert(data) async {
    return await DAO.insert('item', data);
  }

  @override
  Future<int> update(data) async {
    return await DAO.update('item', data);
  }

  @override
  Future<int> delete(int id) async {
    return await DAO.delete('item', id);
  }

  @override
  Future<Map<dynamic, dynamic>?> get(int id) async {
    return await DAO.get('item', id);
  }

  @override
  Future<List<Map<dynamic, dynamic>>?> find(Map<String, dynamic>? query) async {
    String sql = DaoUtils.includeQueriesIntoSql('SELECT * FROM item', query);
    sql += ' ORDER BY nmProduto';
    return DaoUtils.convertToMutableList((await DAO.findRaw(sql))!);
  }
}
