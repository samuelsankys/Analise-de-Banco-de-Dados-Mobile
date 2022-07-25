import 'package:analise_de_banco_de_dados/constants.dart';
import 'package:analise_de_banco_de_dados/screens/result_screen/geral_result/geral_result.dart';
import 'package:analise_de_banco_de_dados/screens/result_screen/grafico_result/grafico_result.dart';
import 'package:analise_de_banco_de_dados/screens/result_screen/operacao_result/operacao_result.dart';
import 'package:analise_de_banco_de_dados/screens/result_screen/resumo_result/resumo_result.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen(
    this.result,
    this.selectDataBase,
  );
  final result;
  final List<bool> selectDataBase;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String tituloGeral = 'Geral';
  String tituloOperacao = 'Operação';
  String tituloResumo = 'Resumo';
  String tituloGrafico = 'Gráfico';

  String tituloOperacaoInsert = 'Insert';
  String tituloOperacaoUpdate = 'Update';
  String tituloOperacaoDelete = 'Delete';
  String tituloOperacaoSelect = 'Select';

  String tituloDataBaseSqlite = 'SQLite';
  String tituloDataBaseSembast = 'Sembast';
  String tituloDataBaseCouchBase = 'Couchbasedb-Lite';
  String tituloDataBaseHive = 'Hive';
  String tituloDataBaseObjectBox = 'ObjectBox';

   Map<String, double> resInsert = {};
    Map<String, double> resSelect = {};
    Map<String, double> resUpdate = {};
    Map<String, double> resDelete = {};
     

    media(valorList) {
      var tam = valorList.length;
      var soma = 0.0;

      for (var i = 0; i < tam; i++) {
        soma += double.parse(valorList[i]);
      }
      return double.parse((soma / tam).toStringAsFixed(6));
    }

  @override
    void initState() {
      super.initState();

      if (widget.selectDataBase[0]) {
        resInsert['sqlite'] = media(widget.result['sqlite']['insert']);
        resSelect['sqlite'] = media(widget.result['sqlite']['select']);
        resUpdate['sqlite'] = media(widget.result['sqlite']['update']);
        resDelete['sqlite'] = media(widget.result['sqlite']['delete']);
      }
      if (widget.selectDataBase[1]) {
        resInsert['couchbase'] = media(widget.result['couchbase']['insert']);
        resSelect['couchbase'] = media(widget.result['couchbase']['select']);
        resUpdate['couchbase'] = media(widget.result['couchbase']['update']);
        resDelete['couchbase'] = media(widget.result['couchbase']['delete']);
      }
      if (widget.selectDataBase[2]) {
        resInsert['hive'] = media(widget.result['hive']['insert']);
        resSelect['hive'] = media(widget.result['hive']['select']);
        resUpdate['hive'] = media(widget.result['hive']['update']);
        resDelete['hive'] = media(widget.result['hive']['delete']);
      }
      if (widget.selectDataBase[3]) {
        resInsert['objectbox'] = media(widget.result['objectbox']['insert']);
        resSelect['objectbox'] = media(widget.result['objectbox']['select']);
        resUpdate['objectbox'] = media(widget.result['objectbox']['update']);
        resDelete['objectbox'] = media(widget.result['objectbox']['delete']);
      }
      if (widget.selectDataBase[4]) {
        resInsert['sembast'] = media(widget.result['sembast']['insert']);
        resSelect['sembast'] = media(widget.result['sembast']['select']);
        resUpdate['sembast'] = media(widget.result['sembast']['update']);
        resDelete['sembast'] = media(widget.result['sembast']['delete']);
      }
   
    }

  @override
  Widget build(BuildContext context) { 

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: kWarningColor,
              title: const Text('Resultados'),
              // Use TabBar to show the three tabs
              bottom: TabBar(
                tabs: const <Widget>[
                  Tab(
                    text: 'Geral',
                  ),
                  Tab(
                    text: 'Operação',
                  ),
                  Tab(
                    text: 'Resumo',
                  ),
                  Tab(
                    text: 'Gráfico',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Container(
                            height: 480,
                            child: SingleChildScrollView(
                              child: Container(
                                child: Column(
                                  children: [
                                    widget.selectDataBase[0]
                                        ? GeralResult(
                                            tituloDataBase:
                                                tituloDataBaseSqlite,
                                            tituloOperacaoInsert:
                                                tituloOperacaoInsert,
                                            tituloOperacaoSelect:
                                                tituloOperacaoSelect,
                                            tituloOperacaoUpdate:
                                                tituloOperacaoUpdate,
                                            tituloOperacaoDelete:
                                                tituloOperacaoDelete,
                                            dataInsert: widget.result['sqlite']
                                                ['insert'],
                                            dataSelect: widget.result['sqlite']
                                                ['select'],
                                            dataUpdate: widget.result['sqlite']
                                                ['update'],
                                            dataDelete: widget.result['sqlite']
                                                ['delete'])
                                        : Container(),
                                    widget.selectDataBase[1]
                                        ? GeralResult(
                                            tituloDataBase:
                                                tituloDataBaseCouchBase,
                                            tituloOperacaoInsert:
                                                tituloOperacaoInsert,
                                            tituloOperacaoSelect:
                                                tituloOperacaoSelect,
                                            tituloOperacaoUpdate:
                                                tituloOperacaoUpdate,
                                            tituloOperacaoDelete:
                                                tituloOperacaoDelete,
                                            dataInsert: widget
                                                .result['couchbase']['insert'],
                                            dataSelect: widget
                                                .result['couchbase']['select'],
                                            dataUpdate: widget
                                                .result['couchbase']['update'],
                                            dataDelete: widget
                                                .result['couchbase']['delete'])
                                        : Container(),
                                    widget.selectDataBase[2]
                                        ? GeralResult(
                                            tituloDataBase: tituloDataBaseHive,
                                            tituloOperacaoInsert:
                                                tituloOperacaoInsert,
                                            tituloOperacaoSelect:
                                                tituloOperacaoSelect,
                                            tituloOperacaoUpdate:
                                                tituloOperacaoUpdate,
                                            tituloOperacaoDelete:
                                                tituloOperacaoDelete,
                                            dataInsert: widget.result['hive']
                                                ['insert'],
                                            dataSelect: widget.result['hive']
                                                ['select'],
                                            dataUpdate: widget.result['hive']
                                                ['update'],
                                            dataDelete: widget.result['hive']
                                                ['delete'])
                                        : Container(),
                                    widget.selectDataBase[3]
                                        ? GeralResult(
                                            tituloDataBase:
                                                tituloDataBaseObjectBox,
                                            tituloOperacaoInsert:
                                                tituloOperacaoInsert,
                                            tituloOperacaoSelect:
                                                tituloOperacaoSelect,
                                            tituloOperacaoUpdate:
                                                tituloOperacaoUpdate,
                                            tituloOperacaoDelete:
                                                tituloOperacaoDelete,
                                            dataInsert: widget
                                                .result['objectbox']['insert'],
                                            dataSelect: widget
                                                .result['objectbox']['select'],
                                            dataUpdate: widget
                                                .result['objectbox']['update'],
                                            dataDelete: widget
                                                .result['objectbox']['delete'])
                                        : Container(),
                                    widget.selectDataBase[4]
                                        ? GeralResult(
                                            tituloDataBase:
                                                tituloDataBaseSembast,
                                            tituloOperacaoInsert:
                                                tituloOperacaoInsert,
                                            tituloOperacaoSelect:
                                                tituloOperacaoSelect,
                                            tituloOperacaoUpdate:
                                                tituloOperacaoUpdate,
                                            tituloOperacaoDelete:
                                                tituloOperacaoDelete,
                                            dataInsert: widget.result['sembast']
                                                ['insert'],
                                            dataSelect: widget.result['sembast']
                                                ['select'],
                                            dataUpdate: widget.result['sembast']
                                                ['update'],
                                            dataDelete: widget.result['sembast']
                                                ['delete'])
                                        : Container(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Container(
                            height: 480,
                            child: SingleChildScrollView(
                              child: Container(
                                child: Column(
                                  children: [
                                    widget.selectDataBase[0]
                                        ? OperacaoResult(
                                            tituloDataBase:
                                                tituloDataBaseSqlite,
                                            tituloOperacaoInsert:
                                                tituloOperacaoInsert,
                                            tituloOperacaoSelect:
                                                tituloOperacaoSelect,
                                            tituloOperacaoUpdate:
                                                tituloOperacaoUpdate,
                                            tituloOperacaoDelete:
                                                tituloOperacaoDelete,
                                            dataInsert: widget.result['sqlite']
                                                ['insert'],
                                            dataSelect: widget.result['sqlite']
                                                ['select'],
                                            dataUpdate: widget.result['sqlite']
                                                ['update'],
                                            dataDelete: widget.result['sqlite']
                                                ['delete'])
                                        : Container(),
                                    widget.selectDataBase[1]
                                        ? OperacaoResult(
                                            tituloDataBase:
                                                tituloDataBaseCouchBase,
                                            tituloOperacaoInsert:
                                                tituloOperacaoInsert,
                                            tituloOperacaoSelect:
                                                tituloOperacaoSelect,
                                            tituloOperacaoUpdate:
                                                tituloOperacaoUpdate,
                                            tituloOperacaoDelete:
                                                tituloOperacaoDelete,
                                            dataInsert: widget
                                                .result['couchbase']['insert'],
                                            dataSelect: widget
                                                .result['couchbase']['select'],
                                            dataUpdate: widget
                                                .result['couchbase']['update'],
                                            dataDelete: widget
                                                .result['couchbase']['delete'])
                                        : Container(),
                                    widget.selectDataBase[2]
                                        ? OperacaoResult(
                                            tituloDataBase: tituloDataBaseHive,
                                            tituloOperacaoInsert:
                                                tituloOperacaoInsert,
                                            tituloOperacaoSelect:
                                                tituloOperacaoSelect,
                                            tituloOperacaoUpdate:
                                                tituloOperacaoUpdate,
                                            tituloOperacaoDelete:
                                                tituloOperacaoDelete,
                                            dataInsert: widget.result['hive']
                                                ['insert'],
                                            dataSelect: widget.result['hive']
                                                ['select'],
                                            dataUpdate: widget.result['hive']
                                                ['update'],
                                            dataDelete: widget.result['hive']
                                                ['delete'])
                                        : Container(),
                                    widget.selectDataBase[3]
                                        ? OperacaoResult(
                                            tituloDataBase:
                                                tituloDataBaseObjectBox,
                                            tituloOperacaoInsert:
                                                tituloOperacaoInsert,
                                            tituloOperacaoSelect:
                                                tituloOperacaoSelect,
                                            tituloOperacaoUpdate:
                                                tituloOperacaoUpdate,
                                            tituloOperacaoDelete:
                                                tituloOperacaoDelete,
                                            dataInsert: widget
                                                .result['objectbox']['insert'],
                                            dataSelect: widget
                                                .result['objectbox']['select'],
                                            dataUpdate: widget
                                                .result['objectbox']['update'],
                                            dataDelete: widget
                                                .result['objectbox']['delete'])
                                        : Container(),
                                    widget.selectDataBase[4]
                                        ? OperacaoResult(
                                            tituloDataBase:
                                                tituloDataBaseSembast,
                                            tituloOperacaoInsert:
                                                tituloOperacaoInsert,
                                            tituloOperacaoSelect:
                                                tituloOperacaoSelect,
                                            tituloOperacaoUpdate:
                                                tituloOperacaoUpdate,
                                            tituloOperacaoDelete:
                                                tituloOperacaoDelete,
                                            dataInsert: widget.result['sembast']
                                                ['insert'],
                                            dataSelect: widget.result['sembast']
                                                ['select'],
                                            dataUpdate: widget.result['sembast']
                                                ['update'],
                                            dataDelete: widget.result['sembast']
                                                ['delete'])
                                        : Container(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Container(
                            height: 480,
                            child: SingleChildScrollView(
                              child: Container(
                                child: Column(
                                  children: [
                                    widget.selectDataBase[0]
                                        ? ResumoResult(
                                            tituloDataBase:
                                                tituloDataBaseSqlite,
                                            tituloOperacaoInsert:
                                                tituloOperacaoInsert,
                                            tituloOperacaoSelect:
                                                tituloOperacaoSelect,
                                            tituloOperacaoUpdate:
                                                tituloOperacaoUpdate,
                                            tituloOperacaoDelete:
                                                tituloOperacaoDelete,
                                            dataInsert: widget.result['sqlite']
                                                ['insert'],
                                            dataSelect: widget.result['sqlite']
                                                ['select'],
                                            dataUpdate: widget.result['sqlite']
                                                ['update'],
                                            dataDelete: widget.result['sqlite']
                                                ['delete'])
                                        : Container(),
                                    widget.selectDataBase[1]
                                        ? ResumoResult(
                                            tituloDataBase:
                                                tituloDataBaseCouchBase,
                                            tituloOperacaoInsert:
                                                tituloOperacaoInsert,
                                            tituloOperacaoSelect:
                                                tituloOperacaoSelect,
                                            tituloOperacaoUpdate:
                                                tituloOperacaoUpdate,
                                            tituloOperacaoDelete:
                                                tituloOperacaoDelete,
                                            dataInsert: widget
                                                .result['couchbase']['insert'],
                                            dataSelect: widget
                                                .result['couchbase']['select'],
                                            dataUpdate: widget
                                                .result['couchbase']['update'],
                                            dataDelete: widget
                                                .result['couchbase']['delete'])
                                        : Container(),
                                    widget.selectDataBase[2]
                                        ? ResumoResult(
                                            tituloDataBase: tituloDataBaseHive,
                                            tituloOperacaoInsert:
                                                tituloOperacaoInsert,
                                            tituloOperacaoSelect:
                                                tituloOperacaoSelect,
                                            tituloOperacaoUpdate:
                                                tituloOperacaoUpdate,
                                            tituloOperacaoDelete:
                                                tituloOperacaoDelete,
                                            dataInsert: widget.result['hive']
                                                ['insert'],
                                            dataSelect: widget.result['hive']
                                                ['select'],
                                            dataUpdate: widget.result['hive']
                                                ['update'],
                                            dataDelete: widget.result['hive']
                                                ['delete'])
                                        : Container(),
                                    widget.selectDataBase[3]
                                        ? ResumoResult(
                                            tituloDataBase:
                                                tituloDataBaseObjectBox,
                                            tituloOperacaoInsert:
                                                tituloOperacaoInsert,
                                            tituloOperacaoSelect:
                                                tituloOperacaoSelect,
                                            tituloOperacaoUpdate:
                                                tituloOperacaoUpdate,
                                            tituloOperacaoDelete:
                                                tituloOperacaoDelete,
                                            dataInsert: widget
                                                .result['objectbox']['insert'],
                                            dataSelect: widget
                                                .result['objectbox']['select'],
                                            dataUpdate: widget
                                                .result['objectbox']['update'],
                                            dataDelete: widget
                                                .result['objectbox']['delete'])
                                        : Container(),
                                    widget.selectDataBase[4]
                                        ? ResumoResult(
                                            tituloDataBase:
                                                tituloDataBaseSembast,
                                            tituloOperacaoInsert:
                                                tituloOperacaoInsert,
                                            tituloOperacaoSelect:
                                                tituloOperacaoSelect,
                                            tituloOperacaoUpdate:
                                                tituloOperacaoUpdate,
                                            tituloOperacaoDelete:
                                                tituloOperacaoDelete,
                                            dataInsert: widget.result['sembast']
                                                ['insert'],
                                            dataSelect: widget.result['sembast']
                                                ['select'],
                                            dataUpdate: widget.result['sembast']
                                                ['update'],
                                            dataDelete: widget.result['sembast']
                                                ['delete'])
                                        : Container(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Container(
                            height: 480,
                            child: SingleChildScrollView(
                              child: Container(
                                child: Column(
                                  children: [
                                    GraficoResult(
                                        tituloDataBase: tituloOperacaoInsert,
                                        data: resInsert,
                                        ),
                                    GraficoResult(
                                        tituloDataBase: tituloOperacaoSelect,
                                        data: resSelect),
                                    GraficoResult(
                                        tituloDataBase: tituloOperacaoUpdate,
                                        data: resUpdate),
                                    GraficoResult(
                                        tituloDataBase: tituloOperacaoDelete,
                                        data: resDelete),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
