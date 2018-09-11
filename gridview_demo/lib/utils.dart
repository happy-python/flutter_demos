import 'package:flutter/material.dart';
import 'package:gridview_demo/model/city.dart';

showSnackBar(BuildContext context, City item) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text("${item.name} is a city in ${item.country}"),
      backgroundColor: Colors.amber,
    ),
  );
}
