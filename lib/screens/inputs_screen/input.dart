import 'package:analise_de_banco_de_dados/constants.dart';
import 'package:analise_de_banco_de_dados/controllers/hive.controller.dart';
import 'package:analise_de_banco_de_dados/controllers/objectBox.controller.dart';
import 'package:analise_de_banco_de_dados/controllers/sqlite.controller.dart';
import 'package:analise_de_banco_de_dados/models/hive.dart';
import 'package:analise_de_banco_de_dados/models/sqlite.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

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
  final HiveHelper hiveHelper = HiveHelper();



  opa(n, r) async{
    var bancos_selecionados = widget.db_select;
    

    bancos_selecionados.forEach((e)=> print(e.toString()));
    
    //operacoesSQLite(n, r);
    operacoesHive();
    //operacoesObjectBox();
    print('Opaaa');
    print(r);
    print(n);
  }

  operacoesObjectBox() async {
    
    var insert = await objectBoxController.insert();
    var select = await objectBoxController.select();
    print('select depois do insert');
    print(insert);
    //print(select);
  }

  operacoesHive() async {
    
    var select = await hiveController.insert();
     //await hiveController.select();
    print('select depois do insert');
    print(select);
  }

  operacoesSQLite(n, r) async {
   sqlite.createTable();
    r = int.parse(r);
    n = int.parse(n);
  print('entrou');
 
    List<int> ids = [];

    for(var i = 0; i < r; i++){
      var inicio = new DateTime.now();
      for(var j = 0; j < n; j++){
        var id = await sqlite.insert();
        ids.add(id);
      }
      var fim = new DateTime.now();
      var difference = fim.difference(inicio);//.inMicroseconds;
      print(difference);
    }

    print(ids);
    //sqlite.closesqlite();
    sqlite.dropTable();
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
                onTap: () {
                  opa(nController.text, rController.text);
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
