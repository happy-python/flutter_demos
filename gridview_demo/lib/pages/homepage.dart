import 'package:flutter/material.dart';
import 'package:gridview_demo/model/city.dart';
import 'package:gridview_demo/widget/mylistview.dart';
import 'package:gridview_demo/widget/mygridview.dart';

class HomePage extends StatelessWidget {
  final List<City> _allCities = City.allCities();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cites around world"),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        child: _getHomePageBody(context),
      ),
    );
  }

  Widget _getHomePageBody(BuildContext context) {
    // 纵向
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MyListView(_allCities);
    } else {
      return MyGridView(_allCities);
    }
  }
}
