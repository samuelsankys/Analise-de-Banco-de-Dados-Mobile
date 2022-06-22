import 'package:analise_de_banco_de_dados/models/objectBox.dart';
import 'package:analise_de_banco_de_dados/models/objectBox_models.dart';
import 'package:objectbox/objectbox.dart';

class ObjectBoxController {

Future<int> insert() async{
    ObjectBoxHelper objectBoxHelper = ObjectBoxHelper();
     return await objectBoxHelper.createItem( ObjectBoxModel(
        A0: 3000, 
        A1: 40.5, 
        A2: 'abcdefghijklmnopqrstuvwxyz', 
        A3: 'abcdefghijklmnopqrstuvwxyz', 
        A4: DateTime.now().toString(),
        A5: DateTime.now()
     ));
  }

  select() async {
    ObjectBoxHelper objectBoxHelper = ObjectBoxHelper();
    return await objectBoxHelper.readItem();
  }
  
  update(id) async {
    ObjectBoxHelper objectBoxHelper = ObjectBoxHelper();
    await objectBoxHelper.updateItem(  ObjectBoxModel(
        A0: 9999, 
        A1: 333.8, 
        A2: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 
        A3: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 
        A4 : DateTime.now().toString(),
        A5 : DateTime.now()
    ));
  }

  delete(id) async {
    ObjectBoxHelper objectBoxHelper = ObjectBoxHelper();
    await objectBoxHelper.deleteItem(id);
  }

}