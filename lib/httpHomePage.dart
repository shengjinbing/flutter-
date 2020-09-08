import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HttpHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('http请求'),
      ),
      body: new Center(
        child: new RaisedButton(onPressed:(){
          const url = 'http://httpbin.org';
          http.get(url).then((response){
            print("状态：${response.statusCode}");
            print("正文：${response.body}");
          });
        },
          child: new Text('发起http请求'),
        ),
      ),
    );
  }

}