import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget imageSection() {
      return Image.asset(
        "images/lake.jpg",
        height: 240.0,
        width: 600.0,
        fit: BoxFit.cover,
      );
    }

    Widget titleSection() {
      return Container(
        margin: EdgeInsets.all(32.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Oeschinen Lake Campground",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "Kandersteg, Switzerland",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red[500],
            ),
            Text("41"),
          ],
        ),
      );
    }

    Widget buttonBuild(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return Column(
        children: <Widget>[
          Icon(
            icon,
            color: color,
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buttonBuild(Icons.call, "CALL"),
          buttonBuild(Icons.near_me, "ROUTE"),
          buttonBuild(Icons.share, "SHARE"),
        ],
      );
    }

    Widget textSection() {
      return Container(
        padding: EdgeInsets.all(32.0),
        child: Text(
          "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",
          softWrap: true,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Top Lakes'),
      ),
      body: ListView(
        children: <Widget>[
          imageSection(),
          titleSection(),
          buttonSection(),
          textSection(),
        ],
      ),
    );
  }
}
