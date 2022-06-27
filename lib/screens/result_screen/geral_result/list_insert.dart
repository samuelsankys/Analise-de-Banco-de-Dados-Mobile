import 'package:flutter/material.dart';

class ListGeral extends StatelessWidget {
  final List<double> data;

  const ListGeral({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height:310,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        //scrollDirection: Axis.vertical,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Text(
            '0,002',
            style: TextStyle(fontSize: 12, color: Colors.black87),
          );
        }),
    );
  }
}
