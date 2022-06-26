
import 'package:flutter/material.dart';

class CalculadoResult extends StatelessWidget {

  final List<double> dataUpdate;
  final List<double> dataDelete;
  final List<double> dataInsert;
  final List<double> dataSelect;
  final String tituloCalculo;

  const CalculadoResult({
    Key? key,
    required this.tituloCalculo,
    required this.dataInsert,
    required this.dataSelect,
    required this.dataUpdate,
    required this.dataDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            tituloCalculo,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '0,00145',
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
              Text(
                '0,00145',
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
              Text(
                '0,00145',
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
              Text(
                '0,00145',
                style: TextStyle(fontSize: 12, color: Colors.black87),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
