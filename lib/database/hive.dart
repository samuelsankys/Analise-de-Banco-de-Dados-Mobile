import 'package:analise_de_banco_de_dados/models/hive_models.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class HiveHelper {

  Future<Box<HiveModel>> createOpenBox()async {
    return await Hive.openBox<HiveModel>('hive_box');
  }
  
  // INSERT
  Future createItem(HiveModel hive) async {
    HiveHelper helper = HiveHelper();
    Box<HiveModel> boxHive = await helper.createOpenBox();
    return await boxHive.add(hive);
    //return hive_box.keys();
  }

  // SELECT
  //Map<String, dynamic> 
  /*Future<List<int>>*/Future readItem(id) async {
    HiveHelper helper = HiveHelper();
    var boxHive = await helper.createOpenBox();
    // List<HiveModel> listItem = [];

    // for (int i = 0; i < boxHive.length; i++){
      var item = await boxHive.getAt(id);

    //   print(item?.key);
    // }
    
    return item;
  }

  Future getAll(ids) async {
    HiveHelper helper = HiveHelper();

    var boxHive = await helper.createOpenBox();
    for (int i = 0; i < ids; i++){
      var item = await boxHive.getAt(i);
      print(item?.toJson());
    }
  }

  // Update an item by id
  updateItem(int itemKey, HiveModel hive) async {
     HiveHelper helper = HiveHelper();
    Box<HiveModel> boxHive = await helper.createOpenBox();
     await boxHive.put(itemKey, hive);
     //var a = await readItem(itemKey);
     //print(a.toJson());
  }

  // Delete
 Future<void> deleteItem(int itemKey) async {
    HiveHelper helper = HiveHelper();
    Box<HiveModel> boxHive = await helper.createOpenBox();
    await boxHive.delete(itemKey);
  }


}
