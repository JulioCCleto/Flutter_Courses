import 'package:app_10/Home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
  theme: ThemeData(
    accentColor: Color(0xFFE7B15C),
    scaffoldBackgroundColor: Colors.grey[50]
  ),
));

