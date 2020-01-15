import 'package:flutter/material.dart';

class Alcoolgasolina extends StatefulWidget {
  @override
  _AlcoolgasolinaState createState() => _AlcoolgasolinaState();
}

class _AlcoolgasolinaState extends State<Alcoolgasolina> {
  String _resultado = "";

  _calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _resultado =
            "Número inválido, digite números maiores que 0 utilize (.)!";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _resultado = "Abasteça com gasolina!";
        });
      } else {
        setState(() {
          _resultado = "Abasteça com Álcool!";
        });
      }
      _limparCampos();
    }
  }

  void _limparCampos() {
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text(
          "Álcool ou Gasosa?",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("assets/logo.png")),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Saiba qual a melhor opção para o abastecimento do seu carro.",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Preço Alcool, ex: 2.90"),
              style: TextStyle(fontSize: 22),
              controller: _controllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Preço gasolina, ex: 4.40"),
              style: TextStyle(fontSize: 22),
              controller: _controllerGasolina,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: RaisedButton(
                onPressed: () {
                  _calcular();
                },
                padding: EdgeInsets.all(15),
                child: Text(
                  "Calcular",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                _resultado,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
