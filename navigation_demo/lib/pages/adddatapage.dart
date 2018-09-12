import 'package:flutter/material.dart';

class AddDataPage extends StatelessWidget {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add City",
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "City Name",
                ),
              ),
              ButtonBar(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      // 返回数据
                      Navigator.pop(context, _controller.text);
                    },
                    child: Text("Add"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
