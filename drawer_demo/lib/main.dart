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
  void _openPage(context, String title) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => DetailPage(title)));
  }

  void _closePage(context) {
    Navigator.pop(context);
  }

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
              onTap: () => _openPage(context, "Page 1 Detail"),
            ),
            ListTile(
              title: Text("Page 2"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _openPage(context, "Page 2 Detail"),
            ),
            ListTile(
              title: Text("close"),
              trailing: Icon(Icons.close),
              onTap: () => _closePage(context),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;

  DetailPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(title),
      ),
    );
  }
}
