import 'package:app_4/clientes.dart';
import 'package:app_4/contatos.dart';
import 'package:app_4/empresa.dart';
import 'package:app_4/servicos.dart';
import 'package:flutter/material.dart';

class ATMConsultoria extends StatefulWidget {
  @override
  _ATMConsultoriaState createState() => _ATMConsultoriaState();
}

class _ATMConsultoriaState extends State<ATMConsultoria> {
  _abrirEmpresa() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Empresa()));
  }

  _abrirServico() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Servicos()));
  }

  _abrirClientes() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Clientes()));
  }

  _abrirContatos() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Contatos()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ATM Consultoria",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.green,
      ),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(32, 70, 32, 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/logo.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 120,
                  width: 120,
                  child: RaisedButton(
                    onPressed: _abrirEmpresa,
                    color: Colors.orange[800],
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 75,
                        ),
                        Text(
                          "A Empresa",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  child: RaisedButton(
                    onPressed: _abrirServico,
                    color: Color(0xFF19d0c9),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.build,
                          color: Colors.white,
                          size: 75,
                        ),
                        Text(
                          "Serviços",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 120,
                  width: 120,
                  child: RaisedButton(
                    onPressed: _abrirClientes,
                    color: Color(0xFFbdcb4a),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.group,
                          color: Colors.white,
                          size: 75,
                        ),
                        Text(
                          "Clientes",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  child: RaisedButton(
                    onPressed: _abrirContatos,
                    color: Color(0xFF64bf92),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.mail,
                          color: Colors.white,
                          size: 75,
                        ),
                        Text(
                          "Contato",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
