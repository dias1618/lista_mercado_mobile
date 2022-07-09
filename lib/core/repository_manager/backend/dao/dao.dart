import 'package:lista_mercado_mobile/core/repository_manager/backend/dao/dao_utils.dart';
import 'package:lista_mercado_mobile/core/repository_manager/backend/database.dart';
import 'package:sqflite/sqflite.dart';

class DAO {
  static Future<int> insert(String table, data) async {
    Database database = (await DatabaseDAO.getInstance())!;
    data['id'] = (await DaoUtils.getLastId(table)) + 1;
    print('insert: table = $table, data = $data');
    return await database.insert(table, data);
  }

  static Future<int> update(String table, data) async {
    Database database = (await DatabaseDAO.getInstance())!;
    print('update: table = $table, data = $data');
    return await database
        .update(table, data, where: 'id = ?', whereArgs: [data['id']]);
  }

  static Future<int> delete(String table, int id) async {
    Database database = (await DatabaseDAO.getInstance())!;
    print('delete: table = $table, id = $id');
    return await database.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  static Future<Map<dynamic, dynamic>?> get(String table, int id) async {
    Database database = (await DatabaseDAO.getInstance())!;
    List<Map> maps =
        await database.query(table, where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

  static Future<List<Map<dynamic, dynamic>>?> find(
      String table, Map<String, dynamic>? query) async {
    Database database = (await DatabaseDAO.getInstance())!;
    return await database.query(table,
        columns: (query != null ? query.keys.toList() : null),
        where: (query != null
            ? query.keys.map((key) => '$key = ?').join(' AND ')
            : null),
        whereArgs: (query != null ? query.values.toList() : null));
  }

  static Future<List<Map<dynamic, dynamic>>?> findRaw(String sql) async {
    Database database = (await DatabaseDAO.getInstance())!;
    print('find: $sql');
    return await database.rawQuery(sql);
  }
}
