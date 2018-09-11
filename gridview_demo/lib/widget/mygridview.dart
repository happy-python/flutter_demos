import 'package:flutter/material.dart';
import 'package:gridview_demo/model/city.dart';
import 'package:gridview_demo/utils.dart';

class MyGridView extends StatelessWidget {
  final List<City> allCities;

  MyGridView(this.allCities);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      padding: EdgeInsets.all(10.0),
      children: allCities.map((City city) {
        return _getGridViewItemUI(context, city);
      }).toList(),
    );
  }

  Widget _getGridViewItemUI(BuildContext context, City city) {
    return InkWell(
      onTap: () {
        showSnackBar(context, city);
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          children: <Widget>[
            Image.asset(
              city.image,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  city.name,
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
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
          ],
        ),
      ),
    );
  }
}
