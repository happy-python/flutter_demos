import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget avatarSection() {
    // Hero 动画
    return Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          // 背景透明
          backgroundColor: Colors.transparent,
          // 半径
          radius: 72.0,
          backgroundImage: AssetImage(
            "alucard.jpg",
          ),
        ),
      ),
    );
  }

  Widget welcomeSection() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome Alucard',
        style: TextStyle(
          fontSize: 28.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget loremSection() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit condimentum mauris id tempor. Praesent eu commodo lacus. Praesent eget mi sed libero eleifend tempor. Sed at fringilla ipsum. Duis malesuada feugiat urna vitae convallis. Aliquam eu libero arcu.',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 获取设备宽度
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          // 渐变色
          gradient: LinearGradient(colors: [
            Colors.blue,
            Colors.lightBlueAccent,
          ]),
        ),
        padding: EdgeInsets.all(28.0),
        child: Column(
          children: <Widget>[
            avatarSection(),
            welcomeSection(),
            loremSection(),
          ],
        ),
      ),
    );
  }
}
