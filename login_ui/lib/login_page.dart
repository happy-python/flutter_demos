import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget logoSection() {
      // Hero 动画
      return Hero(
        tag: 'hero',
        child: CircleAvatar(
          // 背景透明
          backgroundColor: Colors.transparent,
          // 半径
          radius: 48.0,
          child: Image.asset(
            "logo.png",
          ),
        ),
      );
    }

    Widget inputSection() {
      return Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              // 提示文本
              hintText: "Email",
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Password",
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            // 隐藏文本
            obscureText: true,
          ),
        ],
      );
    }

    Widget loginSection() {
      return FlatButton(
        padding: EdgeInsets.all(0.0),
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        child: Container(
          height: 52.0,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: new BorderRadius.circular(30.0),
          ),
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    Widget labelSection() {
      return FlatButton(
        child: Text(
          "Forgot password?",
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        onPressed: () {},
      );
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              logoSection(),
              SizedBox(
                height: 48.0,
              ),
              inputSection(),
              SizedBox(
                height: 24.0,
              ),
              loginSection(),
              labelSection(),
            ],
          ),
        ),
      ),
    );
  }
}
