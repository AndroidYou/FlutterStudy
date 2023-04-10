import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterstudy/others/channel/basic_message_channel.dart';
import 'package:flutterstudy/others/channel/event_channel_route.dart';
import 'package:flutterstudy/others/channel/method_channel_route.dart';

class OtherRoute extends StatefulWidget{
  const OtherRoute({super.key});
  @override
  State<StatefulWidget> createState() => _OtherRoute();
}
class _OtherRoute extends State<OtherRoute>{
  @override
  Widget build(BuildContext context) {
    return ListView(

      children:  [
        const ListTile(
          title: Text('Flutter和Android原生三种通信方式'),
        ),
        ListTile(
          title: const Text('BasicMessageChannel'),
          onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>const BasicMessageChannelRoute()));
          },
        ),
        ListTile(
          title: const Text('EventChannel'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const EventChannelRoute()));
          },
        ), ListTile(
          title: const Text('MethodChannel'),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const MethodChannelRoute()));
          },
        )
      ],
    );
  }

}