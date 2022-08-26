import 'package:analise_de_banco_de_dados/models/objectBox_models.dart';
import 'package:objectbox/objectbox.dart';
import 'package:analise_de_banco_de_dados/objectbox.g.dart';

class ObjectBoxHelper {
  Store? store;
  
  Future<Store> createOpenBox()async {
    return store ??= await openStore(); 
  }

  getBox() async {
    final boxStore = await this.createOpenBox();
    return boxStore.box<ObjectBoxModel>();
    
  }
  
  // INSERT
  Future<int> createItem(ObjectBoxModel objectBox) async {
    final box = await this.getBox();
    return box.put(objectBox);
  }

  // SELECT
  //Map<String, dynamic> 
  readItem() async {
    final box = await this.getBox();
    return box.getAll() as List<ObjectBoxModel>;
  }

  getById(id) async {
    final box = await this.getBox();
    return box.get(id);
  }

  // Update an item by id
  Future<int> updateItem(ObjectBoxModel objectBox) async {
    final box = await this.getBox();
    return box.put(objectBox);
  }

  // Delete
 Future<void> deleteItem(int itemKey) async {
     final box = await this.getBox();
    return box.remove(itemKey);
  }

  closeObjectBox() async{
     final box = await this.getBox();
     await box.removeAll();
  
  }
}
