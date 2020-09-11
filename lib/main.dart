import 'package:flutter/material.dart';
import 'package:flutterapp/providerPage.dart';
import 'package:flutterapp/testHomePage.dart';
import 'package:flutterapp/module.dart';
import 'package:flutterapp/material_design.dart';

import 'androidChannel.dart';
import 'animation/animationPage.dart';
import 'async/asyncPage.dart';
import 'customView/GradientButtonRoute.dart';
import 'functionWidgetPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Map<String, WidgetBuilder> routes = {
    '/container':(BuildContext context) => ContainerHomePage(),
    '/text':(BuildContext context) => TextHomePage(),
    '/longlist':(BuildContext context) => ListHomePage(),
    '/form':(BuildContext context) => FormHomePage(),
    '/appbar':(BuildContext context) => AppBarPage(),
    '/function':(BuildContext context) => AndroidChannelRoute(),
    '/provider':(BuildContext context) => HttpTestRoute(),

  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "hello world",
      home: new HomePage(),
      routes: routes,
      theme: new ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.lightGreen[600], //主要部分的背景色
          accentColor: Colors.orange[600] //前景色（文本，按钮等）
          ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  int count = 0;

  void incremmentCounter(){
    setState(() {
      count++;
    });
  }


  @override
  void initState() {
    super.initState();
    //当Widget第一次插入到Widget树时会被调用，对于每一个State对象，Flutter framework只会
    // 调用一次该回调，所以，通常在该回调中做一些一次性的操作，如状态初始化、订阅子树的事件通知等
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(centerTitle: true, title: new Text('Welcome to Flutter')),
      body: new Center(
        child: new Column(
          //主轴居中对齐
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("data::::::"),
            new Text('$count',style: Theme.of(context).textTheme.display1,)
          ],
        ),
      ),
      floatingActionButton: new Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.grey),
          child: new FloatingActionButton(
            onPressed: incremmentCounter,
            tooltip: 'Increment',
            child: new Icon(Icons.computer),
          )
      ),
    );
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //当State对象的依赖发生变化时会被调用
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    //在widget重新构建时，Flutter framework会调用Widget.canUpdate来检测Widget树中同一位
    // 置的新旧节点，然后决定是否需要更新，如果Widget.canUpdate返回true则会调用此回调。正如之
    // 前所述，Widget.canUpdate会在新旧widget的key和runtimeType同时相等时会返回true，
    // 也就是说在在新旧widget的key和runtimeType同时相等时didUpdateWidget()就会被调用。
  }

  @override
  void deactivate() {
    super.deactivate();
    //当State对象从树中被移除时，会调用此回调
  }

  @override
  void dispose() {
    super.dispose();
    //当State对象从树中被永久移除时调用；通常在此回调中释放资源
  }

  @override
  void reassemble() {
    super.reassemble();
    //此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式
    // 下永远不会被调用。
  }

}
