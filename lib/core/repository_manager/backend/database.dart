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
          'CREATE TABLE IF NOT EXISTS lista(id INTEGER PRIMARY KEY, nmLista TEXT);',
        );
        await db.execute(
          'CREATE TABLE IF NOT EXISTS item(id INTEGER PRIMARY KEY, nmProduto TEXT, qtProduto INTEGER, lgProduto INTEGER, listaId INTEGER, categoriaId INTEGER);'
        );
        await db.execute(
          'CREATE TABLE IF NOT EXISTS categoria(id INTEGER PRIMARY KEY, nmCategoria TEXT);',
        );
        await db.execute(
          'CREATE TABLE IF NOT EXISTS lista_usada(id INTEGER PRIMARY KEY, listaId INTEGER, dtUso TIMESTAMP, lgFechada INTEGER);',
        );
        await db.execute(
          'CREATE TABLE IF NOT EXISTS item_usado(id INTEGER PRIMARY KEY, listaUsadaId INTEGER, itemId INTEGER, lgMarcado INTEGER);',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async{
        await db.execute(
          'CREATE TABLE IF NOT EXISTS lista(id INTEGER PRIMARY KEY, nmLista TEXT);',
        );
        await db.execute(
          'CREATE TABLE IF NOT EXISTS item(id INTEGER PRIMARY KEY, nmProduto TEXT, qtProduto INTEGER, lgProduto INTEGER, listaId INTEGER, categoriaId INTEGER);'
        );
        await db.execute(
          'CREATE TABLE IF NOT EXISTS categoria(id INTEGER PRIMARY KEY, nmCategoria TEXT);',
        );
        await db.execute(
          'CREATE TABLE IF NOT EXISTS lista_usada(id INTEGER PRIMARY KEY, listaId INTEGER, dtUso TIMESTAMP, lgFechada INTEGER);',
        );
        await db.execute(
          'CREATE TABLE IF NOT EXISTS item_usado(id INTEGER PRIMARY KEY, listaUsadaId INTEGER, itemId INTEGER, lgMarcado INTEGER);',
        );
      },
      version: 2,
    );
  }

}