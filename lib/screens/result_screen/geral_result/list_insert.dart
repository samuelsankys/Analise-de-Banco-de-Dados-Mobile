import 'package:flutter/material.dart';

class ListGeral extends StatelessWidget {
  final List<dynamic> data;

  const ListGeral({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height:data.length*14+50,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        //scrollDirection: Axis.vertical,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Text(
            data[index],
            style: TextStyle(fontSize: 12, color: Colors.black87),
          );
        }),
    );
  }
}
