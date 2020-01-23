import 'package:app_10/Champions.dart';
import 'package:app_10/Spells.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "League of Sounds",
          style: TextStyle(color: Color(0xFFE7B15C), fontSize: 20),
        ),
        backgroundColor: Colors.grey[900],
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              child: Text(
                "Champions",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Tab(
              child: Text(
                "Summoner Spells",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      body: _body(),
    );
  }

  _body() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        Champions(),
        Spells(),
      ],
    );
  }
}
