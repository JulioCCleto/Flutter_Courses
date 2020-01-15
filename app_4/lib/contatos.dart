import 'package:flutter/material.dart';

class Contatos extends StatefulWidget {
  @override
  _ContatosState createState() => _ContatosState();
}

class _ContatosState extends State<Contatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contatos",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.green,
      ),
      body: _body(),
    );
  }

  _body() {
   return  Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.mail,
                size: 75,
                color: Color(0xFF64bf92),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  "Contatos",
                  style: TextStyle(fontSize: 30, color: Color(0xFF64bf92)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
