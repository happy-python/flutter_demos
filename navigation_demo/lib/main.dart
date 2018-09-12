import 'package:flutter/material.dart';
import 'package:navigation_demo/pages/homepage.dart';
import 'package:navigation_demo/pages/adddatapage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Tutorial",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (BuildContext context) => HomePage(),
        "/add": (BuildContext context) => AddDataPage(),
      },
      initialRoute: "/",
    );
  }
}
