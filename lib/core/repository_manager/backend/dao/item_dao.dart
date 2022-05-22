import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/categoria_dao.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/dao.dart';

class ItemDAO{

  final CategoriaDAO categoriaDAO = CategoriaDAO();

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
    String sql = 'SELECT * FROM item';
    if(query != null){
      sql += ' WHERE ';
      print('query.keys = ' + query.keys.toString());
      for(String key in query.keys){
        sql += '$key = ${query[key]} AND ';
      }
      sql = sql.substring(0, sql.length - 5);
    }
    List<Map<dynamic, dynamic>> newMap = List<Map<dynamic, dynamic>>.empty(growable: true);
    List<Map<dynamic, dynamic>> map =  (await DAO.findRaw(sql))!;
    print('map = ' + map.toString());
    for(Map<dynamic, dynamic> itemMap in map){
      Map<dynamic, dynamic> item = Map<String, dynamic>.from(itemMap);
      item['lgProduto'] = item['lgProduto']==0?false:true;
      if(item['categoriaId'] != null){
        item['categoria'] = await categoriaDAO.get(item['categoriaId']);
      }
      newMap.add(item);
    }
    return newMap;
  }
}