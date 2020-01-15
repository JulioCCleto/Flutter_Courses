import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FrasesDoDia(),
    );
  }
}

class FrasesDoDia extends StatefulWidget {
  @override
  _FrasesDoDiaState createState() => _FrasesDoDiaState();
}

class _FrasesDoDiaState extends State<FrasesDoDia> {
  var _frases = [
    "O Segredo para a imortalidade? Não morra! - Master Yi",
    "Posso pressentir o Perigo e o caos. - Lee Sin",
    "Eu não sou intrigante. - Ezreal"
  ];

  var _fraseFixa = "Clique no botão para gerar uma frase!";
  void _frasesGeradas() {
    var numeroSorteado = Random().nextInt(_frases.length);
    setState(() {
      _fraseFixa = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Frases do dia",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/logo.png",
              fit: BoxFit.contain,
              width: 250,
              height: 150,
            ),
            Text(
              _fraseFixa,
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            RaisedButton(
              onPressed: _frasesGeradas,
              child: Text(
                "Nova frase",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
