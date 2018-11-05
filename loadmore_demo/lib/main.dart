import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'Loadmore'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  // 生成数组
  final numbers = List.generate(20, (i) => i);
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // 监听现在的位置是否下滑到了底部
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        // 加载更多数据
        loadMore(numbers.length);
      }
    });
  }

  loadMore(int from) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
    }
    // 延迟处理任务
    await Future.delayed(Duration(seconds: 15), () {
      setState(() {
        isLoading = false;
        numbers.addAll(List.generate(20, (i) => i + from));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            // 如果下滑到底部，显示加载动画，否则正常显示 ListTile
            if (index == numbers.length) {
              return Center(
                child: Opacity(
                  opacity: isLoading ? 1.0 : 0.0,
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListTile(
                title: Text('item ${numbers[index]}'),
                leading: CircleAvatar(
                  child: Text('$index'),
                  backgroundColor: Colors.pink,
                ),
              );
            }
          },
          separatorBuilder: (BuildContext context, int index) => Divider(),
          // 记得在这里加1
          itemCount: numbers.length + 1),
    );
  }
}
