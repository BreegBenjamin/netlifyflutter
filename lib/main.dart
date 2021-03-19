import 'package:flutter/material.dart';
import 'package:paris_app_web/src/Pages/bookpage.dart';
import 'package:paris_app_web/src/Pages/calculadora_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Paris App',
        initialRoute: 'calc',
        routes: <String, WidgetBuilder>{
          'book': (BuildContext context) => BookPage(),
          'calc' : (BuildContext context)=> CalculadoraPage(), 
        });
  }
}
