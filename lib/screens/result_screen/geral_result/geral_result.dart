import 'package:analise_de_banco_de_dados/screens/result_screen/geral_result/calculado_result.dart';
import 'package:analise_de_banco_de_dados/screens/result_screen/geral_result/coluna_operacao_geral.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class GeralResult extends StatefulWidget {
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
  final List<dynamic> dataInsert;
  final List<dynamic> dataUpdate;
  final List<dynamic> dataDelete;
  final List<dynamic> dataSelect; 

  @override
  State<GeralResult> createState() => _GeralResultState();
}

class _GeralResultState extends State<GeralResult> {
  var mediaInsert = 0.0;
  var mediaSelect = 0.0;
  var mediaUpdate = 0.0;
  var mediaDelete = 0.0;
  var varianciaInsert = 0.0;
  var varianciaSelect = 0.0;
  var varianciaUpdate = 0.0;
  var varianciaDelete = 0.0;
  var limInferiorInsert = 0.0;
  var limInferiorSelect = 0.0;
  var limInferiorUpdate = 0.0;
  var limInferiorDelete = 0.0;
  var limSuperiorInsert = 0.0;
  var limSuperiorSelect = 0.0;
  var limSuperiorUpdate = 0.0;
  var limSuperiorDelete = 0.0;
     
 @override
  void initState() {
    super.initState();

    mediaInsert = media(widget.dataInsert);
    mediaSelect = media(widget.dataSelect);
    mediaUpdate = media(widget.dataUpdate);
    mediaDelete = media(widget.dataDelete);

    varianciaInsert = variancia(widget.dataInsert, mediaInsert);
    varianciaSelect = variancia(widget.dataSelect, mediaSelect);
    varianciaUpdate = variancia(widget.dataUpdate, mediaUpdate);
    varianciaDelete = variancia(widget.dataDelete, mediaDelete);

    limInferiorInsert = limInferior(widget.dataInsert, mediaInsert, varianciaInsert);
    limInferiorSelect = limInferior(widget.dataSelect, mediaSelect, varianciaSelect);
    limInferiorUpdate = limInferior(widget.dataUpdate, mediaUpdate, varianciaUpdate);
    limInferiorDelete = limInferior(widget.dataDelete, mediaDelete, varianciaDelete);

    limSuperiorInsert = limSuperior(widget.dataInsert, mediaInsert, varianciaInsert);
    limSuperiorSelect = limSuperior(widget.dataSelect, mediaSelect, varianciaSelect);
    limSuperiorUpdate = limSuperior(widget.dataUpdate, mediaUpdate, varianciaUpdate);
    limSuperiorDelete = limSuperior(widget.dataDelete, mediaDelete, varianciaDelete);
  }

  limInferior(valorList, valorMedia, valorVariancia){
    var tam = valorList.length;
    var soma = 0.0;
    var z = {
      1: 63.657,
      2: 9.925,
      3: 5.841,
      4: 4.604,
      5: 4.032,
      6: 3.707,
      7: 3.499,
      8: 3.355,
      9: 3.250,
      10: 3.169,
      11: 3.106,
      12: 3.055,
      13: 3.012,
      14: 2.977,
      15: 2.947,
      16: 2.921,
      17: 2.898,
      18: 2.878,
      19: 2.861,
      20: 2.845
    };
    var desviopadrao = sqrt(valorVariancia);
    
    return valorMedia - (z[tam-1]!*(desviopadrao/sqrt(tam)));
  }

  limSuperior(valorList, valorMedia, valorVariancia){
    var tam = valorList.length;
    var z = {
      1: 63.657,
      2: 9.925,
      3: 5.841,
      4: 4.604,
      5: 4.032,
      6: 3.707,
      7: 3.499,
      8: 3.355,
      9: 3.250,
      10: 3.169,
      11: 3.106,
      12: 3.055,
      13: 3.012,
      14: 2.977,
      15: 2.947,
      16: 2.921,
      17: 2.898,
      18: 2.878,
      19: 2.861,
      20: 2.845
    };
    var desviopadrao = sqrt(valorVariancia);
    
    return valorMedia + (z[tam-1]!*(desviopadrao/sqrt(tam)));
  }

  variancia(valorList, valorMedia){
    var tam = valorList.length;
    var soma = 0.0;

    for(var i=0; i < tam; i++){
      soma += pow((double.parse(valorList[i]) - valorMedia),2);
    }
    return soma/tam;
  }

  media(valorList){
    var tam = valorList.length;
    var soma = 0.0;

    for(var i=0; i < tam; i++){
      soma += double.parse(valorList[i]);
    }
    return soma/tam;
  }




  @override
  Widget build(BuildContext context) {
    String tituloCalculoMedia = 'Média';
    String tituloCalculoVariancia = 'Variância';
    String tituloCalculoInferior = 'Limite Inferior';
    String tituloCalculoSuperior = 'Limite Superior';


    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  widget.tituloDataBase,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColunaOperacaoGeral(
                  titulo: widget.tituloOperacaoInsert, data: widget.dataInsert),
              ColunaOperacaoGeral(
                  titulo: widget.tituloOperacaoSelect, data: widget.dataSelect),
              ColunaOperacaoGeral(
                  titulo: widget.tituloOperacaoUpdate, data: widget.dataUpdate),
              ColunaOperacaoGeral(
                  titulo: widget.tituloOperacaoDelete, data: widget.dataDelete),
            ],
          ),
          CalculadoResult(
            tituloCalculo: tituloCalculoMedia,
            dataInsert: mediaInsert, 
            dataSelect: mediaSelect, 
            dataUpdate: mediaUpdate,
            dataDelete: mediaDelete
          ),
          CalculadoResult(
            tituloCalculo: tituloCalculoVariancia,
            dataInsert: varianciaInsert, 
            dataSelect: varianciaSelect, 
            dataUpdate: varianciaUpdate,
            dataDelete: varianciaDelete
          ),
          CalculadoResult(
            tituloCalculo: tituloCalculoSuperior,
            dataInsert: limSuperiorInsert, 
            dataSelect: limSuperiorSelect, 
            dataUpdate: limSuperiorUpdate,
            dataDelete: limSuperiorDelete
          ),
          CalculadoResult(
            tituloCalculo: tituloCalculoInferior,
            dataInsert: limInferiorInsert, 
            dataSelect: limInferiorSelect, 
            dataUpdate: limInferiorUpdate,
            dataDelete: limInferiorDelete
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

