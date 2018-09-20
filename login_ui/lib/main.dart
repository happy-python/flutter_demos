import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // 定义路由
  final Map<String, WidgetBuilder> routes = {
    "/": (BuildContext context) => LoginPage(),
    "/home": (BuildContext context) => HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: '/',
    );
  }
}
