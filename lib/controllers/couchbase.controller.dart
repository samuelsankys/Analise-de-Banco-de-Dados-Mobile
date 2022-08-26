import 'package:analise_de_banco_de_dados/database/couchbase.dart';
import 'package:analise_de_banco_de_dados/models/couchbase_models.dart';

class CouchBaseController {
 final _couchBaseHelper = CouchBaseHelper();
 
Future<int> insert(id) async{
     return await _couchBaseHelper.createItem( CouchBaseModel(
        A0: 3000, 
        A1: 40.5, 
        A2: 'abcdefghijklmnopqrstuvwxyz', 
        A3: 'abcdefghijklmnopqrstuvwxyz', 
        A4: DateTime.now().toString(),
        A5: DateTime.now().toString()
     ), id);
  }

  select(id) async {
    return await _couchBaseHelper.readItem(id);
  }

  selectAll() async{
    return await _couchBaseHelper.selectAll();
  }
  
  update(id) async {
    await _couchBaseHelper.updateItem(  CouchBaseModel(
        A0: 9999, 
        A1: 333.8, 
        A2: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 
        A3: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 
        A4 : DateTime.now().toString(),
        A5 : DateTime.now().toString()
    ), id);
  }

  delete(id) async {
    await _couchBaseHelper.deleteItem(id);
  }
  openDataBase() async{
    await _couchBaseHelper.openDB();
  }
  closeObject() async{
    await _couchBaseHelper.closeCouchBase();
  }
  dropObject() async{
    await _couchBaseHelper.closeCouchBase();
  }
}