
import 'package:analise_de_banco_de_dados/models/couchbase_models.dart';
import 'package:cbl/cbl.dart';



class CouchBaseHelper {
  Database? database;


  Future openDB() async {
    database = await Database.openAsync('couchbase2');
  } 
  
  // INSERT
  Future<int> createItem(CouchBaseModel couchBase, id) async {
    await openDB();
    final doc = MutableDocument.withId(id.toString(), couchBase.toJson());
    await database?.saveDocument(doc);
    return id;
  }

  // SELECT
  Future<dynamic> readItem(id) async {
    final doc = await database?.document(id.toString());
    return doc;
  }

  // Update an item by id
  Future updateItem(CouchBaseModel couchBase, id) async {
    final doc = await database?.document(id.toString());

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
  Future<void> deleteItem(id) async {
    final doc = await database?.document(id.toString());
    if(doc != null){
      await database?.deleteDocument(doc);
    }
  }

  selectAll()async{
    final query = const QueryBuilder()
    .select(
      SelectResult.all()
    )
    .from(DataSource.database(database!));

  final resultSet = await query.execute();
  final results = await resultSet
    .asStream()
    // Converts each result into a `Map`, consisting only of plain Dart values.
    .map((result) => result.toPlainMap())
    .toList();

  print(results);
  }

  closeCouchBase() async{
     database?.close();
  }
 
}
