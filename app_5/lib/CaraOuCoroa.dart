import 'dart:math';
import 'package:app_5/Resultado.dart';
import 'package:flutter/material.dart';

class CaraouCoroa extends StatefulWidget {
  @override
  _CaraouCoroaState createState() => _CaraouCoroaState();
}

class _CaraouCoroaState extends State<CaraouCoroa> {
  
  _resultado() {
    var opcao = ["cara","coroa"];
    var escolha = Random().nextInt(opcao.length);
    var jogo = opcao[escolha];
   
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Resultado(jogo)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6abe8c),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/logo.png"),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: GestureDetector(
                onTap: _resultado,
                child: Image.asset(
                  "assets/botao_jogar.png",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
