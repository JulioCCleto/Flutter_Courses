import 'package:flutter/material.dart';

class Empresa extends StatefulWidget {
  @override
  _EmpresaState createState() => _EmpresaState();
}

class _EmpresaState extends State<Empresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Empresa",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.green,
      ),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.person,
                  size: 75,
                  color: Colors.orange[800],
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    "Sobre a empresa",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.orange[800],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Texto",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),         
          ],
        ),
      ),
    );
  }
}
