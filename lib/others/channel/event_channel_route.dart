import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventChannelRoute extends StatefulWidget{
  const EventChannelRoute({super.key});

  @override
  State<StatefulWidget> createState() =>_EventChannelRoute();

}
class _EventChannelRoute extends State<EventChannelRoute>{
  late EventChannel _eventChannel;

  @override
  void initState() {
    super.initState();
    _eventChannel = const EventChannel("eventChannel");
    _eventChannel.receiveBroadcastStream().listen( (event){
      print("Flutter:Flutter receive from Android:$event");
    },onDone: (){
      print("完成");
    },onError: (error){
      print("失败：$error");
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('EventChannel'),
      ),
      body: Center(),
    );
  }

}