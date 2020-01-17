import 'package:app_7/pages/Biblioteca.dart';
import 'package:app_7/pages/EmAlta.dart';
import 'package:app_7/pages/Inicio.dart';
import 'package:app_7/pages/inscricao.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceatual = 0;
  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/youtube.png",
          height: 25,
          width: 100,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: telas[_indiceatual],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceatual,
        onTap: (indice){
          setState(() {
            _indiceatual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red[600],
        items: [
          BottomNavigationBarItem(
            title: Text("Início"),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            title: Text("Em alta"),
            icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
            title: Text("Inscrições"),
            icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
            title: Text("Biblioteca"),
            icon: Icon(Icons.video_library)
          ),
        ],
      ),
    );
  }

}
