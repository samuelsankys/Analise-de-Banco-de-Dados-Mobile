

import 'package:flutter/material.dart';

class ListGeral extends StatelessWidget {
  final List<double> data;

  const ListGeral({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index){
          return Text(
            data[index].toString(),
          style: TextStyle(
              fontSize: 12,
              color: Colors.black87),
        );
        }
       
          
        
      ),
    );
  }
}