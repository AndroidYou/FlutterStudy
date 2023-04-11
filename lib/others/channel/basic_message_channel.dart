
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
  String _backContent = '等待接收Android返回的值';
  @override
  void initState() {
    super.initState();
    //创建BasicMessageChannel对象并定义channel的name，必须和Android一端保持一致
    _messageChannel = const BasicMessageChannel<String>("baseMessageChannel",
        StringCodec());
    //设置setMessageHandler
    _messageChannel.setMessageHandler((message) async {
       setState(() {
          _backContent = message??"";
       });
      return "flutter already received reply ";
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BasicMessageChannel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_backContent),
            const SizedBox(height: 30,),
            InkWell(
             child: OutlinedButton(
               onPressed: () {
                 //发送消息给Android原生
                 _messageChannel.send("Hello Android,I come form Flutter");
               },
               child: const Text("点击发送数据给Android原生"),

             ),
            )
          ],
        ),
      ),
    );
  }


}
