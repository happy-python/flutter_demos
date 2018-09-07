import 'package:flutter/material.dart';
import 'package:listview_demo/model/city.dart';

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
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _getItemUI(context, index);
          },
          itemCount: _allCities.length,
        ),
      ),
    );
  }

  Widget _getItemUI(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Image.asset(
              "assets/" + _allCities[index].image,
              fit: BoxFit.cover,
              width: 100.0,
            ),
            title: Text(
              _allCities[index].name,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _allCities[index].country,
                  style: TextStyle(
                    fontSize: 13.0,
                  ),
                ),
                Text(
                  "Population: ${_allCities[index].population}",
                  style: TextStyle(
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
            onTap: () {
              _showSnackBar(context, _allCities[index]);
            },
          )
        ],
      ),
    );
  }

  _showSnackBar(BuildContext context, City item) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("${item.name} is a city in ${item.country}"),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
