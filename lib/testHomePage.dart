import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'module.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('homepage'),
      ),
      body: new Center(
          child: new Column(
        children: <Widget>[
          new RaisedButton(
            onPressed: () {
              var pushNamed =
                  Navigator.pushNamed(context, '/container', arguments: "传参")
                      .then((value) => {
                            //页面关闭的时候返回的值
                            print(value)
                          });
            },
            child: Text('容器组件'),
          ),
          new RaisedButton(
            onPressed: () {
              //Navigator.pushNamed(context, '/text');
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return new FadeTransition(
                            opacity: animation, child: TextHomePage());
                      }));
            },
            child: Text('文本组件'),
          ),
          new RaisedButton(
            onPressed: () {
              //Navigator.pushNamed(context, '/longlist');
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ListHomePage(),
                  ));
            },
            child: Text('长列表组件'),
          ),
          new RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/form');
            },
            child: Text('表单组件'),
          ),
          new RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/appbar');
            },
            child: Text('appBar'),
          ),
          new RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/function');
            },
            child: Text('功能性组件案例'),
          ),
          new RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/provider');
              //showDeleteConfirmDialog1(context);
            },
            child: Text('provider'),
          ),
          new RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/github');
              //showDeleteConfirmDialog1(context);
            },
            child: Text('github'),
          )
        ],
      )),
    );
  }

  // 弹出对话框
  Future<bool> showDeleteConfirmDialog1(context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}

class TestHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('使用第三方包示例'),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            const url = 'https://www.baidu.com';
            launch(url);
          },
          child: new Text('打开百度'),
        ),
      ),
    );
  }
}
