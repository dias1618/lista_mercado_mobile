import 'package:lista_mercado_mobile/core/repository_manager/backend/database.dart';
import 'package:sqflite/sqflite.dart';

class DaoUtils{
  static Future<int> getLastId(String table) async {
    Database database = (await DatabaseDAO.getInstance())!;
    List<Map> map = await database.rawQuery('SELECT MAX(id) as ID_MAX FROM $table');
    int id = map[0]['ID_MAX']??0;
    return id;
  }

  static String includeQueriesIntoSql(String sql, Map<String, dynamic>? query){
    if(query != null){
      sql += ' WHERE ';
      for(String key in query.keys){
        sql += '$key = ${query[key]} AND ';
      }
      sql = sql.substring(0, sql.length - 5);
    }
    return sql;
  }

  static List<Map<dynamic, dynamic>> convertToMutableList(List<Map<dynamic, dynamic>> map){
    List<Map<dynamic, dynamic>> newMap = List<Map<dynamic, dynamic>>.empty(growable: true);
    for(Map<dynamic, dynamic> itemMap in map){
      Map<dynamic, dynamic> item = Map<String, dynamic>.from(itemMap);
      newMap.add(item);
    }
    return newMap;
  }

}