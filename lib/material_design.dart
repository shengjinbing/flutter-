import 'package:flutter/material.dart';

class AppBarPage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyAppBarPage();

}

class _MyAppBarPage extends State<AppBarPage>{
  int _selectedIndex = 1;//当前选中的索引
  final _widgetOptions = [
    Text('Index 0 信息'),
    Text('Index 1 通讯录'),
    Text('Index 2 发现'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('AppBar应用按钮'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
            tooltip: '搜索',
            onPressed: (){},),
          IconButton(icon: Icon(Icons.add),
            tooltip: '添加',
            onPressed: (){},),
        ],
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex]
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon:Icon(Icons.chat),title: Text('信息')),
          BottomNavigationBarItem(icon:Icon(Icons.contacts),title: Text('通讯录')),
          BottomNavigationBarItem(icon:Icon(Icons.account_circle),title: Text('发现')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,//选项中项的颜色
        onTap: _onItemTapped,//选择按下去
      ),
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}