1.因为在 Dart 中一切都是对象，数字类型 也不例外
int lineCount;默认值为null
2.dynamic name = 'Bob';动态类型
3.Final 和 Const
  使用过程中从来不会被修改的变量， 可以使用 final 或 const, 而不是 var 或者其他类型， Final 变量的值只能被设置一次； 
  Const 变量在编译时就已经固定 (Const 变量 是隐式 Final 的类型.) 最高级 final 变量或类变量在第一次使用时被初始化。
4.String
  使用连续三个单引号或者三个双引号实现多行字符串对象的创建：
  
  var s1 = '''
  You can create
  multi-line strings like this one.
  ''';
  
  var s2 = """This is also a
  multi-line string.""";
5.List
  var list = [1, 2, 3];
6.Set
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  var names = <String>{};
7.Map
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };
   Map 中不包含所要查找的 key
   assert(gifts['fifth'] == null);
8.Symbol 字面量是编译时常量。
9.函数
  1.Dart 是一门真正面向对象的语言， 甚至其中的函数也是对象，并且有它的类型 Function 。 这也意味着函数可以被赋值给变量或者
  作为参数传递给其他函数。 也可以把 Dart 类的实例当做方法来调用 
  2.函数中只有一句表达式  
  bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;
  3.命名可选参数
  enableFlags(bold: true, hidden: false);
  定义函数是，使用 {param1, param2, …} 来指定命名参数：
  void enableFlags({bool bold, bool hidden}) {...}
  4.此时 Scrollbar 是一个构造函数， 当 child 参数缺少时，分析器会提示错误。
  const Scrollbar({Key key, @required Widget child})
  5.位置可选参数，将参数放到 [] 中来标记参数是可选的：
  String say(String from, String msg, [String device]){}
  6.匿名函数
    list.forEach(
        (item) => print('${list.indexOf(item)}: $item')); 
  7.词法闭包
  /// 返回一个函数，返回的函数参数与 [addBy] 相加。
  Function makeAdder(num addBy) {
    return (num i) => addBy + i;
  }
  
10.类：Dart 是一种基于类和 mixin 继承机制的面向对象的语言。 每个对象都是一个类的实例，所有的类都继承于 Object. 。 基
      于 * Mixin 继承* 意味着每个类（除 Object 外） 都只有一个超类， 一个类中的代码可以在其他多个继承类中重复使用
   1、使用 ?. 来代替 . ， 可以避免因为左边对象可能为 null 
   2、Dart 2 中，构造函数前面的的 new 关键字是可选的
   3、获取对象的类型，使用对象的 runtimeType 属性， 可以在运行时获取对象的类型， runtimeType 属性回返回一个 Type 对象。
   4、构造函数
      class Point {
        num x, y;
      
        // 在构造函数体执行前，
        // 语法糖已经设置了变量 x 和 y。
        Point(this.x, this.y);
        // 命名构造函数
          Point.origin() {
            x = 0;
            y = 0;
          }
      }
   5.构造函数不被继承（重点）
     子类不会继承父类的构造函数。 子类不声明构造函数，那么它就只有默认构造函数 (匿名，没有参数) 。
   6.命名构造函数
   7.初始化列表
     // 在构造函数体执行之前，
     // 通过初始列表设置实例变量。
     Point.fromJson(Map<String, num> json)
         : x = json['x'],
           y = json['y'] {
       print('In Point.fromJson(): ($x, $y)');
     }
   8.重定向构造函数
      // 指向主构造函数
     Point.alongXAxis(num x) : this(x, 0);
   9.工厂构造函数，则使用 factory 关键字，一个工厂构造函数可能会返回一个 cache 中的实例， 或者可能返回一个子类的实例。
   10.noSuchMethod()
11.使用枚举
   enum Color { red, green, blue }
   枚举中的每个值都有一个 index getter 方法， 该方法返回值所在枚举类型定义中的位置（从 0 开始）
   assert(Color.red.index == 0);
   List<Color> colors = Color.values;使用枚举的 values 常量
12.为类添加功能： Mixin
   1.Mixin 是复用类代码的一种途径， 复用的类可以在不同层级，之间可以不存在继承关系。
   通过 with 后面跟一个或多个混入的名称，来 使用 Mixin 
   2.如果 Mixin 不希望作为常规类被使用，使用关键字 mixin 替换 class
   3.指定只有某些类型可以使用的 Mixin - 比如， Mixin 可以调用 Mixin 自身没有定义的方法 - 使用 on 来指定可以使用 Mixin 的父类类型：
   mixin MusicalPerformer on Musician {
     // ···
   }
   4.类变量和方法
   使用 static 关键字实现类范围的变量和方法。
   5.可调用类（重点）通过实现类的 call() 方法， 能够让类像函数一样被调用。
     class WannabeFunction {
       call(String a, String b, String c) => '$a $b $c!';
     }
     main() {
       var wf = new WannabeFunction();
       var out = wf("Hi","there,","gang");
       print('$out');
     }
            
13.泛型
   1.运行时中的泛型集合（重点，重点）
   Dart 中泛型类型是 固化的，也就是说它们在运行时是携带着类型信息的。 例如， 在运行时检测集合的类型：
   ar names = List<String>();
   names.addAll(['Seth', 'Kathy', 'Lars']);
   print(names is List<String>); // true
   2.泛型函数
   T first<T>(List<T> ts) {
     // Do some initial work or error checking, then...
     T tmp = ts[0];
     // Do some additional checking or processing...
     return tmp;
   }
   这里的 first (<T>) 泛型可以在如下地方使用参数 T ： 
   函数的返回值类型 (T).
   参数的类型 (List<T>).
   局部变量的类型 (T tmp).
14.库和可见性：import 'package:test/test.dart';
   指定库前缀：import 'package:lib2/lib2.dart' as lib2;
   导入库的一部分：import 'package:lib1/lib1.dart' show foo; import 'package:lib2/lib2.dart' hide foo;
   延迟加载库：import 'package:greetings/hello.dart' deferred as hello;
             当需要使用的时候，使用库标识符调用 loadLibrary() 函数来加载库：
             Future greet() async {
               await hello.loadLibrary();
               hello.printGreeting();
             }
15.异步支持
   1.处理Feature
   await lookUpVersion();
   要使用 await ， 代码必须在 异步函数（使用 async 标记的函数）中：
   Future checkVersion() async {
     var version = await lookUpVersion();
     // Do something with version
   }
   提示： 虽然异步函数可能会执行耗时的操作， 但它不会等待这些操作。 相反，异步函数只有在遇到第一个 await 表达式（详情见）
   时才会执行。 也就是说，它返回一个 Future 对象， 仅在await表达式完成后才恢复执行。
   2.声明异步函数
   Future<String> lookUpVersion() async => '1.0.0';
16.处理 Stream
   当需要从 Stream 中获取数据值时， 可以通过一下两种方式：
   使用 async 和 一个 异步循环 （await for）。
   使用 Stream API, 更多详情，参考 in the library tour。
   一下是异步for循环的使用形式：
   await for (varOrType identifier in expression) {
     // Executes each time the stream emits a value.
   }
17.Isolates（独立）重要概念
   大多数计算机中，甚至在移动平台上，都在使用多核CPU。 为了有效利用多核性能，开发者一般使用共享内存数据来保证多线程的正确执行。 
   然而， 多线程共享数据通常会导致很多潜在的问题，并导致代码运行出错。所有 Dart 代码都在隔离区（ isolates ）内运行，而不
   是线程。 每个隔离区都有自己的内存堆，确保每个隔离区的状态都不会被其他隔离区访问。
18.Typedefs
   在 Dart 中，函数也是对象，就想字符和数字对象一样。 使用 typedef ，或者 function-type alias 为函数起一个别名，
   别名可以用来声明字段及返回值类型。 当函数类型分配给变量时，typedef会保留类型信息。
   typedef Compare = int Function(Object a, Object b);
   assert(coll.compare is Function);
   assert(coll.compare is Compare);
19.元数据
   1.自定义元数据注解
   library todo;
   
   class Todo {
     final String who;
     final String what;
   
     const Todo(this.who, this.what);
   }
   使用 @todo 注解的示例：
   
   import 'todo.dart';
   
   @Todo('seth', 'make this do something')
   void doSomething() {
     print('do something');
   }
  元数据可以在 library、 class、 typedef、 type parameter、 constructor、 factory、 function、 field、 
  parameter 或者 variable 声明之前使用，也可以在 import 或者 export 指令之前使用。 使用反射可以在运行时获取元数据信息



             

                                              





 



     

      
   


