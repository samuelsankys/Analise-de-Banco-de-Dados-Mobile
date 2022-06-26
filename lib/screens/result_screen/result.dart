import 'package:analise_de_banco_de_dados/screens/result_screen/geral_result/geral_result.dart';
import 'package:analise_de_banco_de_dados/screens/result_screen/menu.dart';
import 'package:flutter/material.dart';

import 'geral_result/coluna_operacao_geral.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen(
    this.result,
  );
  final bool result;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<bool> _abas = [true, false, false, false];
  String tituloGeral = 'Geral';
  String tituloOperacao = 'Operação';
  String tituloResumo = 'Resumo';
  String tituloGrafico = 'Gráfico';

  String tituloOperacaoInsert = 'Insert';
  String tituloOperacaoUpdate = 'Update';
  String tituloOperacaoDelete = 'Delete';
  String tituloOperacaoSelect = 'Select';

  List<double> dataInsert = [0.10, 0.11,0.45];
  List<double> dataUpdate = [0.10, 0.11,0.45];
  List<double> dataDelete = [0.10, 0.11,0.45];
  List<double> dataSelect = [0.10, 0.11,0.45];

  String tituloDataBase = 'SQLite';

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
                      'Resultados',
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
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Menu(
                            titulo: tituloGeral,
                            ativo: _abas[0],
                            onFlatButtonPress: () {
                              setState(() {
                                _abas = _abas.map<bool>((v) => false).toList();
                                _abas[0] = true;
                              });
                            }),
                        Menu(
                            titulo: tituloOperacao,
                            ativo: _abas[1],
                            onFlatButtonPress: () {
                              setState(() {
                                _abas = _abas.map<bool>((v) => false).toList();
                                _abas[1] = true;
                              });
                            }),
                        Menu(
                            titulo: tituloResumo,
                            ativo: _abas[2],
                            onFlatButtonPress: () {
                              print('clicked');
                              setState(() {
                                _abas = _abas.map<bool>((v) => false).toList();
                                _abas[2] = true;
                                print('clicked');
                              });
                            }),
                        Menu(
                            titulo: tituloGrafico,
                            ativo: _abas[3],
                            onFlatButtonPress: () {
                              setState(() {
                                _abas = _abas.map<bool>((v) => false).toList();
                                _abas[3] = true;
                              });
                            }),
                      ],
                    ),
                    GeralResult(
                      tituloDataBase: tituloDataBase,
                      tituloOperacaoInsert: tituloOperacaoInsert, 
                      tituloOperacaoSelect: tituloOperacaoSelect, 
                      tituloOperacaoUpdate: tituloOperacaoUpdate, 
                      tituloOperacaoDelete: tituloOperacaoDelete,
                      dataInsert: dataInsert,
                      dataSelect: dataSelect,
                      dataUpdate: dataUpdate,
                      dataDelete: dataDelete
                      ),
                   
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


