import 'package:flutter/material.dart';

void main() => runApp(FriendlychatApp());

class FriendlychatApp extends StatelessWidget {
  // 定义全局主题
  final ThemeData iOSTheme = ThemeData(
    primarySwatch: Colors.blue,
  );

  final ThemeData defaultTheme = ThemeData(
    primarySwatch: Colors.orange,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friendlychat',
      // 使用 Theme.of(context).platform 获取平台
      theme: Theme.of(context).platform == TargetPlatform.iOS
          ? iOSTheme
          : defaultTheme,
      home: ChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  // 使用 TextEditingController 来读取输入字段的内容，并在发送文本消息后清除字段
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  bool _isComposing = false;

  void _handleSubmitted(String text) {
    if (text.length > 0) {
      final ChatMessage message = ChatMessage(
        text: text,
        animationController: AnimationController(
          vsync: this,
          duration: Duration(
            milliseconds: 300,
          ),
        ),
      );
      // 调用 setState 修改 _messages 达到让框架重建 UI 的目的
      // 只应在 setState 中执行同步操作，否则框架可能会在操作完成之前重建 widgets
      setState(() {
        _messages.insert(0, message);
        _isComposing = false;
      });
      message.animationController.forward();
      _textController.clear();
    }
  }

  Widget _buildTextComposer() {
    /// 使用 IconTheme + _isComposing 来动态控制 IconButton 的外观和行为
    /// 如果用户输入了文本内容，_isComposing 为 true，按钮的颜色被设置为 Theme.of(context).accentColor
    /// 如果用户没有输入文本内容，_isComposing 为 false，onPressed 属性被置为 null，禁用发送按钮，框架会自动将按钮的颜色更改为 Theme.of(context).disabledColor
    return IconTheme(
      data: IconThemeData(
        // 获取全局设置的颜色，避免硬编码
        color: Theme.of(context).accentColor,
      ),
      child: Container(
        // 水平边距
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  // 提示文本
                  hintText: "Send a message",
                ),
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(
                  Icons.send,
                ),
                onPressed: _isComposing
                    ? () => _handleSubmitted(_textController.text)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 处理动画控制器在不再需要时释放资源是一种很好的做法
  @override
  void dispose() {
    for (var message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friendlychat"),
        // 阴影效果
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) =>
                    _messages[index],
                // 使 ListView 从屏幕底部开始显示
                reverse: true,
                padding: EdgeInsets.all(8.0),
              ),
            ),
            Divider(
              height: 1.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: _buildTextComposer(),
            ),
          ],
        ),
        decoration: Theme.of(context).platform == TargetPlatform.iOS
            ? BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey[300],
                  ),
                ),
              )
            : null,
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final AnimationController animationController;

  ChatMessage({this.text, this.animationController});

  @override
  Widget build(BuildContext context) {
    const String _name = '帅哥';
    // 动画效果
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceIn,
      ),
      child: Container(
        // 垂直边距
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              // 右边距
              margin: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                child: Text(_name[0]),
              ),
            ),
            // 使用 Expanded 包裹长文本
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _name,
                    // 获取全局设置的文本主题，避免硬编码
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
