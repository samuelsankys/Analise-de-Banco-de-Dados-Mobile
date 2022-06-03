import 'package:analise_de_banco_de_dados/screens/home_screen/home.dart';
import 'package:analise_de_banco_de_dados/screens/inputs_screen/input.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( ABD());
}

class ABD extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Análise de Banco de Dados',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'balbal':
            return MaterialPageRoute(
              builder: (_) => HomeScreen(),
            );
          
          default:
            return MaterialPageRoute(
              builder: (_) => HomeScreen(),
            );
        }
      },
    );
  }
}


