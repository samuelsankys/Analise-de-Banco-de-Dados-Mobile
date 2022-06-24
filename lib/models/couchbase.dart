
import 'package:analise_de_banco_de_dados/models/couchbase_models.dart';
import 'package:cbl/cbl.dart';



class CouchBaseHelper {
  Database? database;


  Future openDB() async {
    database = await Database.openAsync('couchbase');
    //return database;
  }
  
  // INSERT
  Future<bool> createItem(CouchBaseModel couchBase) async {
     await openDB();
    final doc = MutableDocument.withId('couch',couchBase.toJson());
    final a = await database?.saveDocument(doc);
    if(a != null){
      return a;
    }else{
      return false;
    }
  }

//   // SELECT
  readItem() async {
    final doc = await database?.document('couch');
    return doc?.sequence;
  }

  // Update an item by id
  Future updateItem(CouchBaseModel couchBase) async {
    final doc = await database?.document('couch');

    final mutableDoc = doc!.toMutable();
    mutableDoc['A0'].value = couchBase.A0;
    mutableDoc['A1'].value = couchBase.A1;
    mutableDoc['A2'].value = couchBase.A2;
    mutableDoc['A3'].value = couchBase.A3;
    mutableDoc['A4'].value = couchBase.A4;
    mutableDoc['A5'].value = couchBase.A5;

    await database?.saveDocument(mutableDoc);
  }

  // Delete
 Future<void> deleteItem(CouchBaseModel couchBase) async {
    final doc = await database?.document('couch');
    await database?.deleteDocument(doc!);
  }

  closeCouchBase() async{
     database?.close();
  }
}
