import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelRoute extends StatefulWidget{
  const MethodChannelRoute({super.key});

  @override
  State<StatefulWidget> createState() =>_MethodChannelRoute();

}
class _MethodChannelRoute extends State<MethodChannelRoute>{
  late MethodChannel _methodChannel;
  @override
  void initState() {
    super.initState();
    _methodChannel = const MethodChannel('methodChannel');
    _initMethodChannel();

  }
  _initMethodChannel() async{
    _methodChannel.setMethodCallHandler((call) async {

    });
    var map = {'name':'小明','age':18};
   String result  = await _methodChannel.invokeMethod('openMethodChannel',map);
   print("Flutter接收Android返回的结果:$result");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MethodChannel'),
      ),
      body: Center(),
    );
  }

}