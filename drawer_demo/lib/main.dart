import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Tutorial",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Jack"),
              accountEmail: Text("jack@gmail.com"),
              decoration: BoxDecoration(color: Colors.orange),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("avatar.png"),
                backgroundColor: Colors.black26,
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.black26,
                  child: Text("A"),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black26,
                  child: Text("B"),
                ),
              ],
            ),
            ListTile(
              title: Text("Page 1"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("Page 2"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("close"),
              trailing: Icon(Icons.close),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
