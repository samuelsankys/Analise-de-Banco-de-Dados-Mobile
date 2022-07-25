
import 'package:analise_de_banco_de_dados/screens/result_screen/resumo_result/calculado_result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ResumoResult extends StatefulWidget {
  const ResumoResult({
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
  State<ResumoResult> createState() => _ResumoResultState();
}

class _ResumoResultState extends State<ResumoResult> {
  var mediaInsert = 0.0;
  var mediaSelect = 0.0;
  var mediaUpdate = 0.0;
  var mediaDelete = 0.0;

     
 @override
  void initState() {
    super.initState();

    mediaInsert = media(widget.dataInsert);
    mediaSelect = media(widget.dataSelect);
    mediaUpdate = media(widget.dataUpdate);
    mediaDelete = media(widget.dataDelete);
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 10),
                child: Text('Insert',
                style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 10),
                child: Text('Select',
                style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 10),
                child: Text('Update',
                style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 10),
                child: Text('Delete',
                style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          CalculadoResult(
            dataInsert: mediaInsert, 
            dataSelect: mediaSelect, 
            dataUpdate: mediaUpdate,
            dataDelete: mediaDelete
          ),
        ],
      ),
    );
  }
}

