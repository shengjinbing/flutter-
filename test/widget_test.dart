// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutterapp/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  test("description", () {
    var s1 = 'String '
        'concatenation'
        " works even over line breaks.";
    assert(s1 ==
        'String concatenation works even over '
            'line breaks.');

    var s2 = 'The + operator ' + 'works, as well.';
    assert(s2 == 'The + operator works, as well.');
  });

  test("测试函数是否相等", (){
    var x;

    // 比较顶级函数。
    x = foo;
    assert(foo == x);

    // 比较静态方法。
    x = A.bar;
    assert(A.bar == x);

    // 比较实例方法。
    var v = A(); // A的1号实例
    var w = A(); // A的2号实例
    var y = w;
    x = w.baz;

    // 两个闭包引用的同一实例（2号）,
    // 所以它们相等。
    assert(y.baz == x);

    // 两个闭包引用的非同一个实例，
    // 所以它们不相等。
    assert(v.baz != w.baz);
  });

  test("构造两个相同的编译时常量会产生一个唯一的，标准的实例",(){

    //var a = const ImmutablePoint(1, 1);
    //var b = const ImmutablePoint(1, 1);

    //assert(identical(a, b)); // 它们是同一个实例。
  });

}
void foo() {} // 顶级函数

class A {
  static void bar() {} // 静态方法
  void baz() {} // 示例方法
}