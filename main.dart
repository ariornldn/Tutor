import 'package:flutter/material.dart';
import 'package:rekor/login.dart';
import 'package:rekor/home.dart';
// import 'dart:async';

void main() => runApp(MyApp());

String usern;
String pass;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekor App',
      theme: ThemeData(primaryColor: Colors.red, accentColor: Colors.redAccent),
      initialRoute: '/',
      routes: {
        '/': (context) => Register(),
        '/second': (BuildContext context) => Home(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
