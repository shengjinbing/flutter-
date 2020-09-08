import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

class HttpClientHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('http请求'),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: getWeatherData,
          child: new Text('发起httpclient请求'),
        ),
      ),
    );
  }

  void getWeatherData() async {
    const url = 'http://t.weather.sojson.com/api/weather/city/101030100';
    try {
      //实例化一个HttpClient
      HttpClient httpClient = new HttpClient();
      //发起请求
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      //等待服务器返回数据
      HttpClientResponse response = await request.close();
      //使用utf8.decoder从response里面解析数据
      var result = await response.transform(utf8.decoder).join();
      //输出响应头
      print(result);

      //httpClient关闭
      httpClient.close();
    } catch (e) {
      print("请求失败：${e}");
    } finally {}
  }
}
