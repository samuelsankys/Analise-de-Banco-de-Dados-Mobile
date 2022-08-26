
import 'package:flutter/material.dart';

class CalculadoResult extends StatefulWidget {

  final double dataUpdate;
  final double dataDelete;
  final double dataInsert;
  final double dataSelect;

  const CalculadoResult({
    Key? key,
    required this.dataInsert,
    required this.dataSelect,
    required this.dataUpdate,
    required this.dataDelete,
  }) : super(key: key);

  @override
  State<CalculadoResult> createState() => _CalculadoResultState();
}

class _CalculadoResultState extends State<CalculadoResult> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            //margin: EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.dataInsert.toStringAsFixed(6),
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
                Text(
                  widget.dataSelect.toStringAsFixed(6),
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
                Text(
                  widget.dataUpdate.toStringAsFixed(6),
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
                Text(
                  widget.dataDelete.toStringAsFixed(6),
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
