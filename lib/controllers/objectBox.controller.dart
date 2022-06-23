import 'package:analise_de_banco_de_dados/models/objectBox.dart';
import 'package:analise_de_banco_de_dados/models/objectBox_models.dart';
import 'package:objectbox/objectbox.dart';

class ObjectBoxController {
 final _objectBoxHelper = ObjectBoxHelper();

Future<int> insert() async{
     return await _objectBoxHelper.createItem( ObjectBoxModel(
        A0: 3000, 
        A1: 40.5, 
        A2: 'abcdefghijklmnopqrstuvwxyz', 
        A3: 'abcdefghijklmnopqrstuvwxyz', 
        A4: DateTime.now().toString(),
        A5: DateTime.now()
     ));
  }

  select() async {
    return await _objectBoxHelper.readItem();
  }
  
  update(id) async {
    await _objectBoxHelper.updateItem(  ObjectBoxModel(
        A0: 9999, 
        A1: 333.8, 
        A2: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 
        A3: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 
        A4 : DateTime.now().toString(),
        A5 : DateTime.now()
    ));
  }

  delete(id) async {
    await _objectBoxHelper.deleteItem(id);
  }

  closeObject() async{
    await _objectBoxHelper.closeObjectBox();
  }
}