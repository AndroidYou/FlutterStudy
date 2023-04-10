
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicMessageChannelRoute extends StatefulWidget{
  const BasicMessageChannelRoute({super.key});

  @override
  State<StatefulWidget> createState() => _BasicMessageChannelRoute();
}
class _BasicMessageChannelRoute extends State<BasicMessageChannelRoute>{
   
  late BasicMessageChannel<String> _messageChannel;
  @override
  void initState() {
    super.initState();
    //创建BasicMessageChannel对象并定义channel的name，必须和Android一端保持一致
    _messageChannel = const BasicMessageChannel<String>("baseMessageChannel",
        StringCodec());
    //设置setMessageHandler
    _messageChannel.setMessageHandler((message) async {
      print("flutter :Message form Android reply:$message");
      return "flutter already received reply ";
    });
    //发送消息给Android原生
    _messageChannel.send("Hello Android,I come form Flutter");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BasicMessageChannel'),
      ),
      body: Center(),
    );
  }


}
