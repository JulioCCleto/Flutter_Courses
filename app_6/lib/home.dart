import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BitCoin extends StatefulWidget {
  @override
  _BitCoinState createState() => _BitCoinState();
}

class _BitCoinState extends State<BitCoin> {

  String _resultado = "";

  _valor() async{
    String url = "https://blockchain.info/ticker";
    http.Response response;

    response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);

    String moeda = retorno["BRL"]["symbol"];
    String valor = retorno["BRL"]["buy"].toString();
    

    setState(() {
    _resultado = "${moeda} ${valor}";
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            Image.asset('assets/bitcoin.png'),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                _resultado,
                style: TextStyle(fontSize: 30 ),
              ),
            ),
            RaisedButton(
                onPressed: _valor,
                color: Colors.orange,
                textColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Atualizar",
                    style: TextStyle(fontSize: 20),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
