import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    //dismissed	动画在起始点停止
    //forward	动画正在正向执行
    //reverse	动画正在反向执行
    //completed
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.completed:
            //动画执行结束时反向执行动画
            controller.reverse();
            break;
          case AnimationStatus.dismissed:
            //动画恢复到初始状态时执行动画（正向）
            controller.forward();
            break;
        }
      });
    //启动动画(正向执行)
    controller.forward();
  }

  /**
   * 上面代码中addListener()函数调用了setState()，所以每次动画生成一个新的数字时，当前帧被标记
   * 为脏(dirty)，这会导致widget的build()方法再次被调用，而在build()中，改变Image的宽高，因
   * 为它的高度和宽度现在使用的是animation.value ，所以就会逐渐放大。值得注意的是动画完成时要释
   * 放控制器(调用dispose()方法)以防止内存泄漏。
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("动画相关"),
        ),
        body: GrowTransition(
          child: Image.asset("assets/house.png"),
          animation: animation,
        ));
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new AnimatedBuilder(
        animation: animation,
        child: Image.asset("assets/house.png"),
        builder: (BuildContext ctx, Widget child) {
          return new Center(
            child: Container(
              width: animation.value,
              height: animation.value,
              child: child,
            ),
          );
        });
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
                height: animation.value, width: animation.value, child: child);
          },
          child: child),
    );
  }
}
