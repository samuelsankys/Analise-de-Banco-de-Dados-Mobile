import 'package:analise_de_banco_de_dados/constants.dart';
import 'package:analise_de_banco_de_dados/constants.dart';
import 'package:analise_de_banco_de_dados/screens/inputs_screen/input.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> _db_select = [false,false,false,false,false];

  @override
  Widget build(BuildContext context) {
    var bancos = ['SQLite','Couchbase-lite','Hive','ObjectBox db','Sembast'];
    var tipo = ['SQL', 'NoSQL','NoSQL','NoSQL','NoSQL'];
    
    
 @override
  void initState() {
    super.initState();
  }


    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 35),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
         
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          'Bancos de dados',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height - 110,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Image.asset(
                            "assets/banco_de_dados.png",
                          ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: MediaQuery.of(context).size.height*.64 ,
                    // padding: EdgeInsets.only(
                    //     left: 10, right: 10, bottom: 1, top: 0),
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Card(
                          child: InkWell(
                            highlightColor: Colors.amber.withOpacity(0.3),
                            splashColor: Colors.amberAccent.withOpacity(0.5),
                            onTap: (){
                              setState(() {
                                _db_select[index] = 
                                  !_db_select[index];
                              });
                            },
                            child: Ink(
                              child: ListTile(
                                dense: true,
                                  title: Row(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        width: 30,
                                        child: Text((index + 1).toString()),
                                      ),
                                      Text(
                                        bancos[index],
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Text(
                                      tipo[index],
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ),
                                 ),
                            ),
                          ),
                          color: _db_select[index] ? 
                            kWarningColor: Colors.white,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      highlightColor: Colors.amber.withOpacity(0.3),
                      splashColor: Colors.amberAccent.withOpacity(0.5),
                      onTap: (){
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    InputScreen(_db_select)));
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
                          color:  kPrimaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
