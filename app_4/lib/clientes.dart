import 'package:flutter/material.dart';

class Clientes extends StatefulWidget {
  @override
  _ClientesState createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Clientes",
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
                Icons.group,
                size: 75,
                color: Color(0xFFbdcb4a),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  "Clientes",
                  style: TextStyle(fontSize: 30, color: Color(0xFFbdcb4a)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
