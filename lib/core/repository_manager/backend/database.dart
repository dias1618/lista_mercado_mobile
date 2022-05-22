import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseDAO{

  static Database? dataBase;

  static Future<Database?> getInstance() async {
    dataBase ??= await _getDatabase();
    return dataBase;
  }

  static Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'lista_mercado.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE lista(id INTEGER PRIMARY KEY, nmLista TEXT);',
        );
        await db.execute(
          'CREATE TABLE item(id INTEGER PRIMARY KEY, nmProduto TEXT, qtProduto INTEGER, lgProduto INTEGER, listaId INTEGER, categoriaId INTEGER);'
        );
        await db.execute(
          'CREATE TABLE categoria(id INTEGER PRIMARY KEY, nmCategoria TEXT);',
        );
      },
      version: 1,
    );
  }

}