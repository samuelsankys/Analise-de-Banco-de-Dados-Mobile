

import 'package:analise_de_banco_de_dados/models/sqlite.dart';
import 'package:sqflite/sqflite.dart';

class SqliteController {

  Future<int> insert() async{
     return await SQLHelper.createItem(
        1000, 
        20.5, 
        'abcdefghijklmnopqrstuvwxyz', 
        'abcdefghijklmnopqrstuvwxyz', 
        DateTime.now().toString(),
        DateTime.now().toString()
        );
  }

  select() async {
    return await SQLHelper.getItems();
  }
  
  update(id) async {
    await SQLHelper.updateItem(
        id,
        9999, 
        333.8, 
        'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 
        'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 
        DateTime.now().toString()
        );
  }
  dropTable() async {
    final db = await SQLHelper.db();
    await SQLHelper.dropTables(db);
  }
  closesqlite() async {
    final db = await SQLHelper.db();
    await db.close();
  }

  createTable() async {
    final db = await SQLHelper.db();
    await SQLHelper.createTables(db);
  }

}