import 'package:analise_de_banco_de_dados/models/sembast_models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

class SembastHelper {
  Database? _db;
  final _store = intMapStoreFactory.store('sebastdb');
  
  
 createOpenBox()async {
    final documentDIR = await getApplicationDocumentsDirectory();
    final dbPath = join(documentDIR.path, 'sembast.db');
    final database = await databaseFactoryIo.openDatabase(dbPath);
    return database;
  }

  Future<Database> getBox() async {
    return await createOpenBox();// StoreRef<int, String>.main();//await createOpenBox();
  }
  
  // INSERT
  Future<int> createItem(SembastModel sembast) async {
    final _db = await getBox();
    var key = await _store.add(await _db, sembast.toJson());
    var record = await _store.record(key).getSnapshot(_db);
    return key;
  }

  // SELECT
   readItem() async {
    final _db = await getBox();
    final recordSnapshot = await _store.find(await _db);
    return recordSnapshot.map((snapshot){
      final sembast = SembastModel.fromJson(snapshot.value);
      return sembast;
    }).toList();
  }

  // Update an item by id
  Future updateItem(SembastModel sembast) async {
    final _db = await getBox();
    final finder = Finder(filter: Filter.byKey(sembast));
    await _store.update(await _db, sembast.toJson(),finder: finder);
    
  }

  // Delete
 Future<void> deleteItem(SembastModel sembast) async {
     final _db = await getBox();
    final finder = Finder(filter: Filter.byKey(sembast));
    await _store.delete(await _db, finder: finder);
  }

  closeSembast() async{
     final _db = await getBox();
     _db.close();
  }
}
