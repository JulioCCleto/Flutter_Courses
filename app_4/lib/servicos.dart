import 'package:flutter/material.dart';

class Servicos extends StatefulWidget {
  @override
  _ServicosState createState() => _ServicosState();
}

class _ServicosState extends State<Servicos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Serviços",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.green,
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.person,
                size: 75, 
                color: Color(0xFF19d0c9),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  "Serviços",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF19d0c9),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
