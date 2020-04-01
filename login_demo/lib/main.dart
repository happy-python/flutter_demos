import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(title: 'Flutter Demo Login Page'),
    );
  }
}

class LoginPage extends StatefulWidget {
  final String title;

  LoginPage({this.title});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //焦点
  FocusNode _focusNodeUserName = FocusNode();
  FocusNode _focusNodePassWord = FocusNode();
  //控制器
  TextEditingController _userNameController = TextEditingController();
  //表单状态
  GlobalKey _formKey = GlobalKey();
  //是否显示密码
  var _isShowPwd = false;
  //是否显示输入框尾部的清除按钮
  var _isShowClear = false;

  @override
  void initState() {
    super.initState();
    //设置焦点监听
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodePassWord.addListener(_focusNodeListener);

    //监听用户名输入框的改变
    _userNameController.addListener(() {
      print(_userNameController.text);
      if (_userNameController.text.length > 0) {
        _isShowClear = true;
      } else {
        _isShowClear = false;
      }

      setState(() {});
    });
  }

  @override
  void dispose() {
    //移出焦点监听
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodePassWord.removeListener(_focusNodeListener);
    _userNameController.dispose();
    super.dispose();
  }

  Future _focusNodeListener() async {
    if (_focusNodeUserName.hasFocus) {
      print('用户名输入框获取焦点');
      //取消密码框的焦点状态
      _focusNodePassWord.unfocus();
    }
    if (_focusNodePassWord.hasFocus) {
      print('密码框输入框获取焦点');
      //取消用户名框的焦点状态
      _focusNodeUserName.unfocus();
    }
  }

  //验证密码
  String validatePassWord(String value) {
    if (value.isEmpty) {
      return '密码不能为空';
    } else if (value.trim().length < 8) {
      return '密码长度不正确';
    }
    return null;
  }

  //验证用户名
  String validateUserName(String value) {
    // 正则匹配手机号
    RegExp exp = RegExp(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');

    if (value.isEmpty) {
      return '用户名不能为空';
    } else if (!exp.hasMatch(value)) {
      return '请输入正确手机号';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    print(ScreenUtil().scaleHeight);

    //logo图片区域
    Widget logoImageArea = Container(
      alignment: Alignment.topCenter,
      //设置图片为圆形
      child: ClipOval(
        child: Image.asset(
          'images/logo.jpg',
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
      ),
    );

    Widget inputTextArea = Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: _userNameController,
              focusNode: _focusNodeUserName,
              //设置键盘类型
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '用户名',
                hintText: '请输入手机号',
                prefixIcon: Icon(Icons.person),
                suffixIcon: _isShowClear
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _userNameController.clear();
                        })
                    : null,
              ),
              validator: validateUserName,
              onSaved: (String value) {
                print(value);
              },
            ),
            TextFormField(
              focusNode: _focusNodePassWord,
              decoration: InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                    icon: Icon(
                      (_isShowPwd ? Icons.visibility : Icons.visibility_off),
                    ),
                    //点击改变显示或隐藏密码
                    onPressed: () {
                      setState(() {
                        _isShowPwd = !_isShowPwd;
                      });
                    }),
              ),
              obscureText: !_isShowPwd,
              validator: validatePassWord,
              onSaved: (String value) {
                print(value);
              },
            ),
          ],
        ),
      ),
    );

    //登录按钮区域
    Widget loginButtonArea = Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 45,
      child: RaisedButton(
        color: Colors.blue[300],
        child: Text(
          '登录',
          style: Theme.of(context).primaryTextTheme.headline,
        ),
        //设置按钮圆角
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

        onPressed: () {
          //点击登录按钮，解除焦点，回收键盘
          _focusNodeUserName.unfocus();
          _focusNodePassWord.unfocus();
        },
      ),
    );

    Widget thirdLoginArea = Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 80,
                height: 1,
                color: Colors.grey,
              ),
              Text('第三方登录'),
              Container(
                width: 80,
                height: 1,
                color: Colors.grey,
              ),
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //第三方库icon图标
              IconButton(
                  color: Colors.green[200],
                  iconSize: 40,
                  icon: Icon(FontAwesomeIcons.weixin),
                  onPressed: () {}),
              IconButton(
                  color: Colors.green[200],
                  iconSize: 40,
                  icon: Icon(FontAwesomeIcons.facebook),
                  onPressed: () {}),
              IconButton(
                  color: Colors.green[200],
                  iconSize: 40,
                  icon: Icon(FontAwesomeIcons.qq),
                  onPressed: () {})
            ],
          ),
        ],
      ),
    );

    Widget bottomArea = Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
              onPressed: () {},
              child: Text(
                '忘记密码',
                style: TextStyle(color: Colors.blue[400], fontSize: 16),
              )),
          FlatButton(
              onPressed: () {},
              child: Text(
                '快速注册',
                style: TextStyle(color: Colors.blue[400], fontSize: 16),
              )),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      //外层添加一个手势，用于点击空白部分，回收键盘
      body: GestureDetector(
        onTap: () {
          //点击空白区域，回收键盘
          print("点击了空白区域");
          _focusNodePassWord.unfocus();
          _focusNodeUserName.unfocus();
        },
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: ScreenUtil().setHeight(80),
            ),
            logoImageArea,
            SizedBox(
              height: ScreenUtil().setHeight(70),
            ),
            inputTextArea,
            SizedBox(
              height: ScreenUtil().setHeight(80),
            ),
            loginButtonArea,
            SizedBox(
              height: ScreenUtil().setHeight(60),
            ),
            thirdLoginArea,
            SizedBox(
              height: ScreenUtil().setHeight(60),
            ),
            bottomArea,
          ],
        ),
      ),
    );
  }
}
