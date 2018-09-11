import 'package:flutter/material.dart';
import 'package:gridview_demo/model/city.dart';
import 'package:gridview_demo/utils.dart';

class MyListView extends StatelessWidget {
  final List<City> allCities;

  MyListView(this.allCities);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _getListViewItemUI(context, allCities[index]);
      },
      itemCount: allCities.length,
    );
  }

  Widget _getListViewItemUI(BuildContext context, City city) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Image.asset(
              city.image,
              fit: BoxFit.cover,
              width: 100.0,
            ),
            title: Text(
              city.name,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  city.country,
                  style: TextStyle(
                    fontSize: 13.0,
                  ),
                ),
                Text(
                  "Population: ${city.population}",
                  style: TextStyle(
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
            onTap: () {
              showSnackBar(context, city);
            },
          )
        ],
      ),
    );
  }
}
