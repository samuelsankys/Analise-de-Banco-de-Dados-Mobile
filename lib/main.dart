import 'package:analise_de_banco_de_dados/screens/home_screen/home.dart';
import 'package:analise_de_banco_de_dados/screens/inputs_screen/input.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:analise_de_banco_de_dados/models/hive_models.dart';
import 'package:cbl_flutter/cbl_flutter.dart';

//import 'package:cbl_flutter/cbl_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //HIVE
  await Hive.initFlutter();
  //await Hive.openBox<HiveModel>('hive_box');
  Hive.registerAdapter(HiveModelAdapter());
  await CouchbaseLiteFlutter.init();

  // OBJECTBOX
  //final store = await openStore(); 
  
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


