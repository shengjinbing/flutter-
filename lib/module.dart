import 'package:flutter/material.dart';

/// 容器组件
class ContainerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //接收传参
    var arguments = ModalRoute.of(context).settings.arguments;
    print(arguments);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('容器组件'),
        leading: Builder(builder: (context) {
          return IconButton(
              icon: Icon(Icons.dashboard, color: Colors.white),
              onPressed: () {

              });
          //自定义图标
        }),
      ),
      body: Center(
          child: Container(
        width: 200,
        height: 200,
        //添加边框装饰效果
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey, //边框颜色
              width: 8.0,
            ),
            image: new DecorationImage(
                image: new AssetImage('assets/2.0x/house.png')),
            borderRadius:
                const BorderRadius.all(const Radius.circular(8.0)) //边框弧度
            ),
        child: RaisedButton(
          child: Text('Flutter',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.0, color: Colors.orange)),
          onPressed: () async {
            await Navigator.pop(context, "我是返回值");
          },
        ),
      )),
    );
  }

}

/// 图片组件
class ImageHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Image demo'),
        ),
        body: Center(
            child: Image.network(
          //图片url
          'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1588145318&di=001f2c9678f421f8cc28465fda59c6f1&src=http://b-ssl.duitang.com/uploads/item/201608/27/20160827172726_GJfX2.jpeg',
          //填充模式
          fit: BoxFit.fitWidth,
        )));
  }
}

///文本
class TextHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('文本组件'),
        ),
        body: Column(
          children: <Widget>[
            Text(
              '红色+黑色删除线+25号',
              style: TextStyle(
                  color: const Color(0xffff0000),
                  decoration: TextDecoration.lineThrough, //删除线
                  decorationColor: const Color(0xff000000),
                  fontSize: 25.0),
            ),
            Text(
              '橙色+下划线+25号',
              style: TextStyle(
                  color: const Color(0xffff9900),
                  decoration: TextDecoration.underline, //删除线
                  decorationColor: const Color(0xff000000),
                  fontSize: 25.0),
            ),
            Text(
              '虚线上划线+25号+倾斜',
              style: TextStyle(
                  decoration: TextDecoration.overline,
                  decorationStyle: TextDecorationStyle.dashed, //删除线
                  decorationColor: const Color(0xff000000),
                  fontSize: 23.0),
            ),
            Text(
              '红色+黑色删除线+25号',
              style: TextStyle(
                  fontSize: 23.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 6.0),
            )
          ],
        ));
  }
}

///长列表
class ListHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> items = new List<String>.generate(500, (i) => "item $i");

    return Scaffold(
        appBar: AppBar(
          title: Text('Image demo'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return new ListTile(
              leading: Icon(Icons.phone),
              title: Text(items[index]),
            );
          },
        ));
  }
}

class FormHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<FormHomePage> {
  //全局Key用来获取Form表单组件
  GlobalKey<FormState> loginKey = new GlobalKey();

  //用户名
  String userName;

  //密码
  String password;

  void login() {
    //读取当前的Form状态
    var loginForm = loginKey.currentState;
    //验证表单
    if (loginForm.validate()) {
      loginForm.save();
      print('userName' + userName + 'password' + password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('表单')),
      body: new Column(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(16.0),
            child: new Form(
              key: loginKey,
              child: new Column(
                children: <Widget>[
                  new TextFormField(
                    decoration: new InputDecoration(
                      labelText: '请输入用户名',
                    ),
                    onSaved: (value) {
                      userName = value;
                    },
                    onFieldSubmitted: (value) {},
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(
                      labelText: '请输入密码',
                    ),
                    obscureText: true,
                    //验证表单
                    validator: (value) {
                      return value.length <= 6 ? "密码长度不够6位" : null;
                    },
                    onSaved: (value) {
                      password = value;
                    },
                  )
                ],
              ),
            ),
          ),
          new SizedBox(
            width: 340,
            height: 42.0,
            child: new RaisedButton(
              onPressed: login,
              child: Text(
                '登录',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}


