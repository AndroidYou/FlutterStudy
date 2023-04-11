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
  String resultContent = '';
  @override
  void initState() {
    super.initState();
    _methodChannel = const MethodChannel('methodChannel');
    _initMethodChannel();

  }
  _initMethodChannel() async{
    _methodChannel.setMethodCallHandler((call) async {

    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MethodChannel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Android原生返回的消息:$resultContent"),
            const SizedBox(height: 50,),
            InkWell(child: OutlinedButton(
              child: const Text("点击发送消息给Android原生"),
              onPressed: () async {
                var map = {'name':'小明','age':18};
               String  result  = await _methodChannel.invokeMethod('openMethodChannel',map);
                 setState(() {
                   resultContent = result;
                 });
              },
            ),)
          ],
        ),
      ),
    );
  }

}