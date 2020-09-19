import 'package:aquadoro/aquadoro.dart';
import 'package:aquadoro/pantalla_carga.dart';
import 'package:flutter/material.dart';
import 'package:aquadoro/goals_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        'pantallaCarga': (BuildContext context) => PantallaDeCarga(),
        'goalsPage': (BuildContext context) => GoalsPage(),
        'aquadoro': (BuildContext context) => Aquadoro(),
      },
      initialRoute: 'pantallaCarga',
    );
  }
}
