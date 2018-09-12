import 'package:flutter/material.dart';
// import 'package:navigation_demo/pages/adddatapage.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({this.title = "Navigation"});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final List<Text> cities = List<Text>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // widget -> HomePage
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // 接收返回的数据
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (BuildContext context) => AddDataPage(),
              //     )).then((value) {
              //   setState(() {
              //     cities.add(Text(
              //       "${cities.length + 1} $value",
              //       textAlign: TextAlign.justify,
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 24.0,
              //       ),
              //     ));
              //   });
              // });
              Navigator.pushNamed(context, "/add").then((value) {
                if (value == null) return;
                setState(() {
                  cities.add(Text(
                    "${cities.length + 1} $value",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ));
                });
              });
            },
          )
        ],
      ),
      body: ListView.separated(
        itemCount: cities.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: cities[index],
          );
        },
      ),
    );
  }
}
