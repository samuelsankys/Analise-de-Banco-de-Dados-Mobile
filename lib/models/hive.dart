import 'package:analise_de_banco_de_dados/models/hive_models.dart';
import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';


class HiveHelper {

  Future<Box<HiveModel>> createOpenBox()async {
    return await Hive.openBox<HiveModel>('hive_box');
  }
  
  // INSERT
  Future<void> createItem(HiveModel hive) async {
    HiveHelper helper = HiveHelper();
    Box<HiveModel> boxHive = await helper.createOpenBox();
    boxHive.add(hive);
    //return hive_box.keys();
  }

  // SELECT
  //Map<String, dynamic> 
  /*Future<List<int>>*/ readItem() async {
    HiveHelper helper = HiveHelper();
    var boxHive = await helper.createOpenBox();
    List<HiveModel> listItem = [];

    for (int i = 0; i < boxHive.length; i++){
      var item = boxHive.getAt(i);

      print(item?.key);
    }
    
    //return item;
  }

  // Update an item by id
  Future<void> updateItem(int itemKey, HiveModel hive) async {
     HiveHelper helper = HiveHelper();
    Box<HiveModel> boxHive = await helper.createOpenBox();
    await boxHive.put(itemKey, hive);
  }

  // Delete
 Future<void> deleteItem(int itemKey) async {
    HiveHelper helper = HiveHelper();
    Box<HiveModel> boxHive = await helper.createOpenBox();
    await boxHive.delete(itemKey);
  }


}
