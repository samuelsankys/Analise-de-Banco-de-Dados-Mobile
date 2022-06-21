

import 'package:analise_de_banco_de_dados/models/hive.dart';
import 'package:analise_de_banco_de_dados/models/sqlite.dart';

import '../models/hive_models.dart';

class HiveController {

  Future<void> insert() async{
    HiveHelper hiveHelper = HiveHelper();
     return await hiveHelper.createItem( HiveModel(
        2000, 
        30.5, 
        'abcdefghijklmnopqrstuvwxyz', 
        'abcdefghijklmnopqrstuvwxyz', 
        DateTime.now().toString(),
        DateTime.now().toString()
     ));
  }

  select() async {
    return await HiveHelper.readItem();
  }
  
  // update(id) async {
  //   await HiveHelper.updateItem(
  //       id,
  //       9999, 
  //       333.8, 
  //       'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 
  //       'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 
  //       DateTime.now().toString()
  //       );
  // }

}