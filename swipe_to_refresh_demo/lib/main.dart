import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage("Refresh Indicator"),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  HomePage(this.title);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // RefreshIndicator requires key to implement state
  final GlobalKey<RefreshIndicatorState> _refreshKey =
      GlobalKey<RefreshIndicatorState>();

  // 初始数据
  User user = User("Default User",
      "https://www.bsn.eu/wp-content/uploads/2016/12/user-icon-image-placeholder-300-grey.jpg");

  // onRefresh(RefreshCallback) method required completable future
  // `Future<Null>` completed with `null`.
  Future<Null> _refresh() {
    return getUser().then((_user) {
      setState(() {
        user = _user;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshKey.currentState.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              tooltip: 'Refresh',
              onPressed: () {
                _refreshKey.currentState.show();
              },
            )
          ],
        ),
        body: RefreshIndicator(
          key: _refreshKey,
          // child is typically ListView or CustomScrollView
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        user.image,
                        height: 128.0,
                        width: 128.0,
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text(user.name),
                    ],
                  ),
                ),
              ),
            ],
          ),
          onRefresh: _refresh,
        ));
  }
}

class User {
  final String name, image;

  User(this.name, this.image);

  factory User.fromJson(Map<String, dynamic> json) {
    json = json['results'][0];
    String name = json['name']['first'] + " " + json['name']['last'];
    String image = json['picture']['large'];
    return User(name, image);
  }
}

Future<User> getUser() async {
  final response = await http.get("https://randomuser.me/api/");
  final json = jsonDecode(response.body);
  return User.fromJson(json);
}
