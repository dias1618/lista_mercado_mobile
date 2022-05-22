import 'package:lista_mercado_mobile/core/repository_manager/backend/database.dart';
import 'package:sqflite/sqflite.dart';

class DAO{

  static Future<int> insert(String table, data) async {
    Database database = (await DatabaseDAO.getInstance())!;
    data['id'] = (await getLastId(table)) + 1;
    print('insert data = ' + data.toString());
    return await database.insert(table, data);
  }

  static Future<int> getLastId(String table) async {
    Database database = (await DatabaseDAO.getInstance())!;
    List<Map> map = await database.rawQuery('SELECT MAX(id) as ID_MAX FROM $table');
    int id = map[0]['ID_MAX']??0;
    return id;
  }

  static Future<int> update(String table, data) async {
    Database database = (await DatabaseDAO.getInstance())!;
    return await database.update(
      table, 
      data,
      where: 'id = ?',
      whereArgs: [data['id']]
    );
  }
  
  static Future<int> delete(String table, int id) async {
    Database database = (await DatabaseDAO.getInstance())!;
    return await database.delete(table,
        where: 'id = ?',
        whereArgs: [id]
    );
  }

  static Future<Map<dynamic, dynamic>?> get(String table, int id) async {
    Database database = (await DatabaseDAO.getInstance())!;
    List<Map> maps = await database.query(table,
        where: 'id = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

  static Future<List<Map<dynamic, dynamic>>?> find(String table, Map<String, dynamic>? query) async {
    Database database = (await DatabaseDAO.getInstance())!;
    return await database.query(table,
      columns: (query != null ? query.keys.toList() : null),
      where: (query != null ? query.keys.map((key) => '$key = ?').join(' AND ') : null),
      whereArgs: (query != null ? query.values.toList() : null)
    );
  }

  static Future<List<Map<dynamic, dynamic>>?> findRaw(String sql) async {
    Database database = (await DatabaseDAO.getInstance())!;
    return await database.rawQuery(sql);
  }
}