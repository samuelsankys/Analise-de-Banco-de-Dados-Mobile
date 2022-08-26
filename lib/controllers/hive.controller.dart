

import 'package:analise_de_banco_de_dados/database/hive.dart';
import 'package:hive/hive.dart';

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

  select(id) async {
    HiveHelper hiveHelper = HiveHelper();
    return await hiveHelper.readItem(id);
  }

  selectAll(ids) async {
    HiveHelper hiveHelper = HiveHelper();
    return await hiveHelper.getAll(ids);
  }

  update(id) async {
    HiveHelper hiveHelper = HiveHelper();
    return await hiveHelper.updateItem(
        id,
        HiveModel(
          9999, 
          333.8, 
          'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 
          'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 
          DateTime.now().toString(),
          DateTime.now().toString()
        )
      );
  }

  delete(id) async{
    HiveHelper hiveHelper = HiveHelper();
    await hiveHelper.deleteItem(id);
  }

  dropHive() async {
    HiveHelper helper = HiveHelper();
    Box<HiveModel> boxHive = await helper.createOpenBox();
    boxHive.clear();
  }
  

}