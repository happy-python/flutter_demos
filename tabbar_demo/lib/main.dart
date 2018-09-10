import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Tutorial',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new TabbedPage(),
    );
  }
}

class TabbedPage extends StatefulWidget {
  @override
  _TabbedPageState createState() => _TabbedPageState();
}

class _TabbedPageState extends State<TabbedPage>
    with SingleTickerProviderStateMixin {
  final List<Widget> tabs = <Widget>[
    Icon(Icons.home),
    Icon(Icons.apps),
    Icon(Icons.build),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBar"),
        leading: Icon(Icons.menu),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: tabs.map((Widget tab) {
          return Center(child: tab);
        }).toList(),
      ),
      bottomNavigationBar: Material(
        color: Colors.deepOrange,
        child: TabBar(
          controller: _tabController,
          tabs: tabs,
        ),
      ),
    );
  }
}
