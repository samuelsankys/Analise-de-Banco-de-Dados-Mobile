import 'dart:async';

import 'package:analise_de_banco_de_dados/constants.dart';
import 'package:analise_de_banco_de_dados/controllers/couchbase.controller.dart';
import 'package:analise_de_banco_de_dados/controllers/hive.controller.dart';
import 'package:analise_de_banco_de_dados/controllers/objectBox.controller.dart';
import 'package:analise_de_banco_de_dados/controllers/sembast.controller.dart';
import 'package:analise_de_banco_de_dados/controllers/sqlite.controller.dart';
import 'package:analise_de_banco_de_dados/database/hive.dart';
import 'package:analise_de_banco_de_dados/database/objectBox.dart';
import 'package:analise_de_banco_de_dados/models/sqlite.dart';
import 'package:flutter/material.dart';

import '../result_screen/result.dart';

class InputScreen extends StatefulWidget {
  InputScreen(
    this.db_select,
  );
  final List<bool> db_select;

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController nController = TextEditingController();
  final TextEditingController rController = TextEditingController();

  final SqliteController sqlite = SqliteController();
  final SQLHelper sqliteHelper = SQLHelper();
  final HiveController hiveController = HiveController();
  final ObjectBoxController objectBoxController = ObjectBoxController();
  final SembastController sembastController = SembastController();
  final CouchBaseController couchBaseController = CouchBaseController();
  final HiveHelper hiveHelper = HiveHelper();
  final ObjectBoxHelper objectBoxHelper = ObjectBoxHelper();



  Future<bool> opa(n, r) async{
    var bancos_selecionados = widget.db_select;
    

    bancos_selecionados.forEach((e)=> print(e.toString()));
    
    //operacoesSQLite(n, r);
    //operacoesHive(n, r);
    operacoesObjectBox(n, r);
    //operacoesSembast();
    //operacoesCoucheBase();

    //print('Opaaa');
    //print(r);
    //print(n);
    return true;
  }


  operacoesCoucheBase()async{
    final db = couchBaseController.openDataBase();
    var insert = await couchBaseController.insert();
    var select = await couchBaseController.select();
    //var insert3 = await couchBaseController.insert();
    print(insert);
    print(select);
    //print(insert3);
    await couchBaseController.closeObject();
  }

  operacoesSembast() async {
    var insert = await sembastController.insert();
     var select = await sembastController.select();
    print(select);
  }

// ############################################################################
// #############   OPERAÇÕES OBJECT BOX   #####################################
// ############################################################################

  operacoesObjectBox(n, r) async {
    r = int.parse(r);
    n = int.parse(n);

    Map<String, List<dynamic>> insertRes = await insertObjectBox(n, r);
    var selectRes = await selectObjectBox(n, r, insertRes['ids']);
    var updateRes = await updateObjectBox(n, r, insertRes['ids']);
    var deleteRes = await deleteObjectBox(n, r, insertRes['ids']);

    print(insertRes['differenceInsert']);
    print(selectRes);
    print(updateRes);
    print(deleteRes);
  
  }

  Future<Map<String, List<dynamic>>> insertObjectBox(n, r) async {
    var differenceInsert = [];
    Map<String, List<dynamic>> result = {};
    List<int> ids = [];

      for(var i = 0; i < r; i++){
        var inicio = new DateTime.now();
        for(var j = 0; j < n; j++){
          var id = await objectBoxController.insert();
          ids.add( id);
        }
        var fim = new DateTime.now();
        var diffEmMicro = (fim.difference(inicio).inMicroseconds);
        var mediaDiff = diffEmMicro/n;
        var convertSecond = mediaDiff/1000000;
        differenceInsert.add(convertSecond.toStringAsFixed(6)); //.insegundo;
      }
      result['ids'] = ids;
      result['differenceInsert'] = differenceInsert;
      //runtimeSqlite['insert'] = differenceInsert;
      return await result;
  }

  Future<List<dynamic>> selectObjectBox(n, r, ids) async{
    var differenceSelect = [];

     for(var i = 0; i < r; i++){
      var inicio = new DateTime.now();
      for(var j = 0; j < n; j++){
        var item = await objectBoxController.select(ids[i+j]);
      }
      var fim = new DateTime.now();
      var diffEmMicro = (fim.difference(inicio).inMicroseconds);
      var mediaDiff = diffEmMicro/n;
      var convertSecond = mediaDiff/1000000;
      differenceSelect.add(convertSecond.toStringAsFixed(6)); //.insegundo;
    }
    //runtimeSqlite['select'] = differenceSelect;
    return differenceSelect;
  }

  Future<dynamic> updateObjectBox(n, r, ids) async{
    var differenceUpdate = [];
    
    for(var i = 0; i < r; i++){
      var inicio = new DateTime.now();
      for(var j = 0; j < n; j++){
        var item = await objectBoxController.update(ids[i+j]);
      }
      var fim = new DateTime.now();
      var diffEmMicro = (fim.difference(inicio).inMicroseconds);
      var mediaDiff = diffEmMicro/n;
      var convertSecond = mediaDiff/1000000;
      differenceUpdate.add(convertSecond.toStringAsFixed(6)); //.insegundo;
    }
    //runtimeSqlite['select'] = differenceSelect;
   
    return differenceUpdate;
  }

  deleteObjectBox(n, r, ids) async{
    var differenceDelete = [];
    
    for(var i = 0; i < r; i++){
      var inicio = new DateTime.now();
      for(var j = 0; j < n; j++){
        await objectBoxController.delete(ids[i+j]);
      }
      var fim = new DateTime.now();
      var diffEmMicro = (fim.difference(inicio).inMicroseconds);
      var mediaDiff = diffEmMicro/n;
      var convertSecond = mediaDiff/1000000;
      differenceDelete.add(convertSecond.toStringAsFixed(6)); //.insegundo;
    }
    //runtimeSqlite['select'] = differenceSelect;
   
    return differenceDelete;
  }
// ############################################################################
// #############   OPERAÇÕES HIVE   ###########################################
// ############################################################################

  operacoesHive(n, r) async {
    r = int.parse(r);
    n = int.parse(n);
  
    var insertRes = await insertHive(n, r);
    var selectRes = await selectHive(n, r);
    var updateRes = await updateHive(n, r);
    var deleteRes = await deleteHive(n, r);

    //var select = await hiveController.selectAll(n*r);

    print(insertRes);
    print(selectRes);
    print(updateRes);
    print(deleteRes);
    //print(select);
    
    await hiveController.dropHive();
  }

  Future<List<dynamic>> insertHive(n, r) async {
    var differenceInsert = [];
    Map<String, List<dynamic>> result = {};
    List<int> ids = [];

      for(var i = 0; i < r; i++){
        var inicio = new DateTime.now();
        for(var j = 0; j < n; j++){
          await hiveController.insert();
        }
        var fim = new DateTime.now();
        var diffEmMicro = (fim.difference(inicio).inMicroseconds);
        var mediaDiff = diffEmMicro/n;
        var convertSecond = mediaDiff/1000000;
        differenceInsert.add(convertSecond.toStringAsFixed(6)); //.insegundo;
      }
      return await differenceInsert;
  }

  Future<List<dynamic>> selectHive(n, r) async{
    var differenceSelect = [];

     for(var i = 0; i < r; i++){
      var inicio = new DateTime.now();
      for(var j = 0; j < n; j++){
        var item = await hiveController.select(i+j);
      }
      var fim = new DateTime.now();
     var diffEmMicro = (fim.difference(inicio).inMicroseconds);
      var mediaDiff = diffEmMicro/n;
      var convertSecond = mediaDiff/1000000;
      differenceSelect.add(convertSecond.toStringAsFixed(6)); //.insegundo;
    }
    //runtimeSqlite['select'] = differenceSelect;
    return differenceSelect;
  }

  Future<dynamic> updateHive(n, r) async{
    var differenceUpdate = [];
    
    for(var i = 0; i < r; i++){
      var inicio = new DateTime.now();
      for(var j = 0; j < n; j++){
        var item = await hiveController.update(i+j);
      }
      var fim = new DateTime.now();
      var diffEmMicro = (fim.difference(inicio).inMicroseconds);
      var mediaDiff = diffEmMicro/n;
      var convertSecond = mediaDiff/1000000;
      differenceUpdate.add(convertSecond.toStringAsFixed(6)); //.insegundo;
    }
    //runtimeSqlite['select'] = differenceSelect;
   
    return differenceUpdate;
  }

  deleteHive(n, r) async{
    var differenceDelete = [];
    
    for(var i = 0; i < r; i++){
      var inicio = new DateTime.now();
      for(var j = 0; j < n; j++){
        await hiveController.delete(i+j);
      }
      var fim = new DateTime.now();
      var diffEmMicro = (fim.difference(inicio).inMicroseconds);
      var mediaDiff = diffEmMicro/n;
      var convertSecond = mediaDiff/1000000;
      differenceDelete.add(convertSecond.toStringAsFixed(6)); //.insegundo;
    }
    //runtimeSqlite['select'] = differenceSelect;
   
    return differenceDelete;
  }

// ############################################################################
// ############# OPERAÇÕES SQLITE  ############################################
// ############################################################################

  operacoesSQLite(n, r) async {
    await sqlite.createTable();
    r = int.parse(r);
    n = int.parse(n);
    
    Map<String, List<dynamic>> runtimeSqlite = {};
    Map<String, List<dynamic>> insertRes = await insertSQLite(n, r );
    var selectRes = await selectSQLite(n, r, insertRes['ids']);
    var updateRes = await updateSQLite(n, r, insertRes['ids']);
    var deleteRes = await deleteSQLite(n, r, insertRes['ids']);

    print(insertRes['differenceInsert']);
    print(selectRes);
    print(updateRes);
    print(deleteRes);

    if( 
       await selectRes.length > 0 && 
       await deleteRes.length > 0 && 
       await updateRes.length > 0){

      await sqlite.closesqlite();
      await sqlite.dropTable();
    }
  }

  Future< Map<String, List<dynamic>>> insertSQLite(n, r ) async {
    var differenceInsert = [];
    Map<String, List<dynamic>> result = {};
    List<int> ids = [];

      for(var i = 0; i < r; i++){
        var inicio = new DateTime.now();
        for(var j = 0; j < n; j++){
          var id = await sqlite.insert();
          ids.add( id);
        }
        var fim = new DateTime.now();
        var diffEmMicro = (fim.difference(inicio).inMicroseconds);
        var mediaDiff = diffEmMicro/n;
        var convertSecond = mediaDiff/1000000;
        differenceInsert.add(convertSecond.toStringAsFixed(6)); //.insegundo;
      }
      result['ids'] = ids;
      result['differenceInsert'] = differenceInsert;
      //runtimeSqlite['insert'] = differenceInsert;
      return await result;
  } 
  Future<List<dynamic>> selectSQLite(n, r, ids) async{
    var differenceSelect = [];

     for(var i = 0; i < r; i++){
      var inicio = new DateTime.now();
      for(var j = 0; j < n; j++){
        var item = await sqlite.select(ids[i+j]);
      }
      var fim = new DateTime.now();
     var diffEmMicro = (fim.difference(inicio).inMicroseconds);
      var mediaDiff = diffEmMicro/n;
      var convertSecond = mediaDiff/1000000;
      differenceSelect.add(convertSecond.toStringAsFixed(6)); //.insegundo;
    }
    //runtimeSqlite['select'] = differenceSelect;
    return differenceSelect;
  }

  Future<dynamic> updateSQLite(n, r, ids) async{
    var differenceUpdate = [];
    
    for(var i = 0; i < r; i++){
      var inicio = new DateTime.now();
      for(var j = 0; j < n; j++){
        var item = await sqlite.update(ids[i+j]);
      }
      var fim = new DateTime.now();
      var diffEmMicro = (fim.difference(inicio).inMicroseconds);
      var mediaDiff = diffEmMicro/n;
      var convertSecond = mediaDiff/1000000;
      differenceUpdate.add(convertSecond.toStringAsFixed(6)); //.insegundo;
    }
    //runtimeSqlite['select'] = differenceSelect;
   
    return differenceUpdate;
  }

  deleteSQLite(n, r, ids) async{
    var differenceDelete = [];
    
    for(var i = 0; i < r; i++){
      var inicio = new DateTime.now();
      for(var j = 0; j < n; j++){
        await sqlite.delete(ids[i+j]);
      }
      var fim = new DateTime.now();
      var diffEmMicro = (fim.difference(inicio).inMicroseconds);
      var mediaDiff = diffEmMicro/n;
      var convertSecond = mediaDiff/1000000;
      differenceDelete.add(convertSecond.toStringAsFixed(6)); //.insegundo;
    }
    //runtimeSqlite['select'] = differenceSelect;
   
    return differenceDelete;
  }








@override
  void dispose(){
    //Hive.box('hive_box').close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 35),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Informe os valores do teste',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Form(
                key: formkey,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 0),
                        child: TextFormField(
                          controller: nController,
                          // enabled: !UserManager.loading,
                          decoration: InputDecoration(
                            hintText: 'N - número de eventos',
                          ),
                          keyboardType: TextInputType.number,
                          autocorrect: false,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return "É necessário informar o valor";
                            }
                            return null;
                          },
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 0),
                        child: TextFormField(
                          controller: rController,
                          // enabled: !UserManager.loading,
                          decoration: InputDecoration(
                            hintText: 'R - número de repetições',
                          ),
                          keyboardType: TextInputType.number,
                          autocorrect: false,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return "É necessário informar o valor";
                            }
                            return null;
                          },
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                highlightColor: Colors.amber.withOpacity(0.3),
                splashColor: Colors.amberAccent.withOpacity(0.5),
                onTap: ()async {
                  final result = await opa(nController.text, rController.text);
                  // Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) =>
                  //                   ResultScreen(result,  widget.db_select)));
                },
                child: Ink(
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Avançar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
