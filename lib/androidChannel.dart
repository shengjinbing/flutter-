import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AndroidChannelRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => AndroidChannelRouteState();

}

class AndroidChannelRouteState extends State<AndroidChannelRoute>{
  static const platform = const MethodChannel('samples.flutter.io/battery');

  String _batteryLevel = 'Unknown battery level.';

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(),
     body: Center(
       child:new Column(
         children: [
           new RaisedButton(
             child: new Text('Get Battery Level'),
             onPressed: _getBatteryLevel,
           ),
           new Text(_batteryLevel),
         ],
       ) ,
     ),
   );
  }

}