import 'package:analise_de_banco_de_dados/constants.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  final String titulo;
  final bool ativo;
  final VoidCallback onFlatButtonPress;

  const Menu({
    Key? key,
    required this.titulo,
    required this.ativo,
    required this.onFlatButtonPress
  }) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late bool active  = widget.ativo;

  @override
  Widget build(BuildContext context) {

    return Container(
      child: InkWell(
        highlightColor: Colors.amber.withOpacity(0.3),
        splashColor: Colors.amberAccent.withOpacity(0.5),
        onTap: () {
         widget.onFlatButtonPress;
        },  
        child: Ink(
          height: 30,
          width: 70,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              widget.titulo,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: this.active? 
                    kPrimaryColor :
                    kWarningColor,
            borderRadius:
                BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ),
    );
  }
}