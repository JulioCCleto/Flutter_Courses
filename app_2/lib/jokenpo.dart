import 'dart:math';

import 'package:flutter/material.dart';

class Jokenpo extends StatefulWidget {
  @override
  _JokenpoState createState() => _JokenpoState();
}

class _JokenpoState extends State<Jokenpo> {
  var _imgpadrao = Image.asset("assets/padrao.png",
      fit: BoxFit.contain, height: 130, width: 130);

  var _imagens = [
    Image.asset("assets/pedrateste.png",
        fit: BoxFit.contain, height: 130, width: 130),
    Image.asset("assets/papelteste.png",
        fit: BoxFit.contain, height: 130, width: 130),
    Image.asset("assets/tesourateste.png",
        fit: BoxFit.contain, height: 130, width: 130)
  ];

  var _resultado = "Resultado";

  var objeto;

  void _selecaoJogo(String escolha) {
    var jogo = Random().nextInt(_imagens.length);
    setState(() {
      _imgpadrao = _imagens[jogo];

      //Poderia também ter usado switch case

      if (escolha == "Pedra") {
        if (jogo == 0) {
          _resultado = ("Empate");
        }
        if (jogo == 1) {
          _resultado = ("Derrota");
        }
        if (jogo == 2) {
          _resultado = ("Vitória");
        }
      }

      if (escolha == "Papel") {
        if (jogo == 1) {
          _resultado = ("Empate");
        }
        if (jogo == 2) {
          _resultado = ("Derrota");
        }
        if (jogo == 0) {
          _resultado = ("Vitória");
        }
      }

      if (escolha == "Tesoura") {
        if (jogo == 0) {
          _resultado = ("Derrota");
        }
        if (jogo == 1) {
          _resultado = ("Vitória");
        }
        if (jogo == 2) {
          _resultado = ("Empate");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "JokenPo",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  _body() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Text(
              "Escolha do App:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
          ),
          Container(
            child: _imgpadrao,
          ),
          Container(
            child: Text(
              "Escolha uma das opções:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selecaoJogo("Pedra");
                    });
                  },
                  child: Image.asset(
                    "assets/pedrateste.png",
                    height: 130,
                    width: 130,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selecaoJogo("Papel");
                    });
                  },
                  child: Image.asset(
                    "assets/papelteste.png",
                    height: 130,
                    width: 130,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selecaoJogo("Tesoura");
                    });
                  },
                  child: Image.asset(
                    "assets/tesourateste.png",
                    height: 130,
                    width: 130,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Text(
              "Resultado:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
          ),
          Text(
            _resultado,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          )
        ],
      ),
    );
  }
}
