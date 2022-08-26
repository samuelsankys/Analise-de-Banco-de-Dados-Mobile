
import 'package:analise_de_banco_de_dados/database/sembast.dart';
import 'package:analise_de_banco_de_dados/models/sembast_models.dart';

class SembastController {
 final _sembastHelper = SembastHelper();

Future<int> insert() async{
  final DateTime date1 = DateTime.now();
     return await _sembastHelper.createItem( SembastModel(
        A0: 3000, 
        A1: 40.5, 
        A2: 'abcdefghijklmnopqrstuvwxyz', 
        A3: 'abcdefghijklmnopqrstuvwxyz', 
        A4: date1.millisecondsSinceEpoch.toString(),
        A5: DateTime.now().toString()
     ));
  }

  select(id) async {
    return await _sembastHelper.getById(id);
  }
  
  update(id) async {
    await _sembastHelper.updateItem(  SembastModel(
        A0: 9999, 
        A1: 333.8, 
        A2: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 
        A3: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 
        A4 : DateTime.now().millisecondsSinceEpoch.toString(),
        A5 : DateTime.now().toString()
    ), id);
  }

  delete(id) async {
    await _sembastHelper.deleteItem(id);
  }

  closeObject() async{
    await _sembastHelper.closeSembast();
  }

  dropDb()async{
    await _sembastHelper.dropSembast();
  }
}