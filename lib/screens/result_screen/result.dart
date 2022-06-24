import 'package:analise_de_banco_de_dados/constants.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen(
    this.result,
  );
  final bool result;
  List<bool> _abas = [true, false, false,false];

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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
                      children: [
                        Container(
                          child: InkWell(
                            highlightColor: Colors.amber.withOpacity(0.3),
                            splashColor: Colors.amberAccent.withOpacity(0.5),
                            onTap: () {
                              
                            },
                            child: Ink(
                              height: 30,
                              width: 60,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Geral',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: kPrimaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                          ),
                        ),
                      ],
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
