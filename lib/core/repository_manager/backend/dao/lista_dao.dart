import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/dao.dart';
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
    String sql = 'SELECT * FROM lista';
    if(query != null){
      sql += ' WHERE ';
      for(String key in query.keys){
        sql += '$key = ${query[key]} AND ';
      }
      sql = sql.substring(0, sql.length - 5);
    }
    List<Map<dynamic, dynamic>> newMap = List<Map<dynamic, dynamic>>.empty(growable: true);
    List<Map<dynamic, dynamic>> map =  (await DAO.findRaw(sql))!;
    for(Map<dynamic, dynamic> itemMap in map){

      Map<dynamic, dynamic> item = Map<String, dynamic>.from(itemMap);

      print('itemMap = ' + item.toString());
      item['itens'] = await itemDAO.find({'listaId': item['id']});
      print('entrou');
      newMap.add(item);
    }

    print('newMap = ' + newMap.toString());
    return newMap;
  }
}