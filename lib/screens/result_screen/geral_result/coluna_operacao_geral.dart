

import 'package:analise_de_banco_de_dados/screens/result_screen/geral_result/list_insert.dart';
import 'package:flutter/material.dart';

class ColunaOperacaoGeral extends StatelessWidget {
  final String titulo;
  final List<double> data;

  const ColunaOperacaoGeral({
    Key? key,
    required this.titulo,
    required this.data
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            titulo,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
        ListGeral(data: data),
      ],
    );
  }
}