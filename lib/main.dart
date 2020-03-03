import 'package:flutter/material.dart';
import 'package:github/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Github Users Search',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          brightness: Brightness.dark,
        ),
        home: Home());
  }
}
