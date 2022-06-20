import 'package:analise_de_banco_de_dados/models/hive_models.dart';
import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';


class HiveHelper {

  Future<Box<HiveModel>> createOpenBox()async {
    return await Hive.openBox<HiveModel>('hive_boxx');
  }
  
  // INSERT
  Future<void> createItem(HiveModel hive) async {
    HiveHelper helper = HiveHelper();
    Box<HiveModel> boxHive = await helper.createOpenBox();
    boxHive.add(hive);
    //return hive_box.keys();
  }

  // SELECT
  Map<String, dynamic> readItem(int key) {
    Box hive_box = Hive.box('hive_box');
    final item = hive_box.get(key);
    return item;
  }

  

  // Update an item by id
  Future<void> updateItem(int itemKey, HiveModel hive) async {
    final hive_box = Hive.box('hive_box');
    await hive_box.put(itemKey, hive);
  }

  // Delete
 Future<void> deleteItem(int itemKey) async {
  final hive_box = Hive.box('hive_box');
    await hive_box.delete(itemKey);
  }

  closeHive(){
    Hive.close();
  }
}
