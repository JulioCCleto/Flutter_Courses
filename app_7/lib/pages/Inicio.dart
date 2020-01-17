import 'package:app_7/API.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    //Instanciando a API
    Api api = Api();
    api.pesquisar("");

    return Container(
      child: Center(
        child: Text(
          "Inicio",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
