import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/dao_utils.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/repository.dart';

class ListaDAO implements Repository {
  @override
  Future<int> insert(data) async {
    return await DAO.insert('lista', data);
  }

  @override
  Future<int> update(data) async {
    return await DAO.update('lista', data);
  }

  @override
  Future<int> delete(int id) async {
    return await DAO.delete('lista', id);
  }

  @override
  Future<Map<dynamic, dynamic>?> get(int id) async {
    return await DAO.get('lista', id);
  }

  @override
  Future<List<Map<dynamic, dynamic>>?> find(Map<String, dynamic>? query) async {
    String sql = DaoUtils.includeQueriesIntoSql('SELECT * FROM lista', query);
    sql += ' ORDER BY nmLista';
    return DaoUtils.convertToMutableList((await DAO.findRaw(sql))!);
  }
}
