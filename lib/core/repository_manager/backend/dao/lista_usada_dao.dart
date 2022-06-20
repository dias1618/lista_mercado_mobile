import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/dao_utils.dart';

class ListaUsadaDAO{

  Future<int> insert(data) async {
    return await DAO.insert('lista_usada', data);
  }

  Future<int> update(data) async {
    return await DAO.update('lista_usada', data);
  }
  
  Future<int> delete(int id) async {
    return await DAO.delete('lista_usada', id);
  }

  Future<Map<dynamic, dynamic>?> get(int id) async {
    return await DAO.get('lista_usada', id);
  }

  Future<List<Map<dynamic, dynamic>>?> find(Map<String, dynamic>? query) async {
    String sql = DaoUtils.includeQueriesIntoSql('SELECT * FROM lista_usada', query);
    sql += ' ORDER BY dtUso DESC';
    return DaoUtils.convertToMutableList((await DAO.findRaw(sql))!);
  }
}