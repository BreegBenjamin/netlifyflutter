import 'package:flutter/material.dart';
import 'package:paris_app_web/src/Pages/bookpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Paris App',
        initialRoute: 'book',
        routes: <String, WidgetBuilder>{
          'book': (BuildContext context) => BookPage(),
        });
  }
}
