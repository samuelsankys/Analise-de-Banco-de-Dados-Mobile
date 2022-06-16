

import 'package:analise_de_banco_de_dados/models/sqlite.dart';

class SqliteController {

  Future<void> insert() async{
     await SQLHelper.createItem(
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

}