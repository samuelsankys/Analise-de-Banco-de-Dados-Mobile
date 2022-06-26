import 'package:analise_de_banco_de_dados/screens/result_screen/geral_result/calculado_result.dart';
import 'package:analise_de_banco_de_dados/screens/result_screen/geral_result/coluna_operacao_geral.dart';
import 'package:flutter/material.dart';

class GeralResult extends StatelessWidget {
  const GeralResult({
    Key? key,
    required this.tituloDataBase,
    required this.tituloOperacaoInsert,
    required this.tituloOperacaoSelect,
    required this.tituloOperacaoUpdate,
    required this.tituloOperacaoDelete,
    required this.dataInsert,
    required this.dataSelect,
    required this.dataUpdate,
    required this.dataDelete
  }) : super(key: key);

  final String tituloOperacaoInsert;
  final String tituloOperacaoSelect;
  final String tituloOperacaoUpdate;
  final String tituloOperacaoDelete;
  final String tituloDataBase;
  final List<double> dataInsert;
  final List<double> dataUpdate;
  final List<double> dataDelete;
  final List<double> dataSelect; 

  @override
  Widget build(BuildContext context) {
    String tituloCalculoMedia = 'Média';
    String tituloCalculoVariancia = 'Variância';
    String tituloCalculoInferior = 'Limite Inferior';
    String tituloCalculoSuperior = 'Limite Superior';


    return Container(
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  tituloDataBase,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColunaOperacaoGeral(
                  titulo: tituloOperacaoInsert, data: dataInsert),
              ColunaOperacaoGeral(
                  titulo: tituloOperacaoSelect, data: dataSelect),
              ColunaOperacaoGeral(
                  titulo: tituloOperacaoUpdate, data: dataUpdate),
              ColunaOperacaoGeral(
                  titulo: tituloOperacaoDelete, data: dataDelete),
            ],
          ),
          CalculadoResult(
            tituloCalculo: tituloCalculoMedia,
            dataInsert: dataInsert, 
            dataSelect: dataSelect, 
            dataUpdate: dataUpdate,
            dataDelete:dataDelete
          ),
          CalculadoResult(
            tituloCalculo: tituloCalculoVariancia,
            dataInsert: dataInsert, 
            dataSelect: dataSelect, 
            dataUpdate: dataUpdate,
            dataDelete:dataDelete
          ),
          CalculadoResult(
            tituloCalculo: tituloCalculoSuperior,
            dataInsert: dataInsert, 
            dataSelect: dataSelect, 
            dataUpdate: dataUpdate,
            dataDelete:dataDelete
          ),
          CalculadoResult(
            tituloCalculo: tituloCalculoInferior,
            dataInsert: dataInsert, 
            dataSelect: dataSelect, 
            dataUpdate: dataUpdate,
            dataDelete:dataDelete
          ),
        ],
      ),
    );
  }
}

