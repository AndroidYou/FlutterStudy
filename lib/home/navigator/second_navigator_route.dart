import 'package:flutter/material.dart';
import 'package:flutterstudy/common/common_button.dart';
import 'package:flutterstudy/common/common_scaffold.dart';

class SecondNavigatorRoute extends StatelessWidget {
  const SecondNavigatorRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        title: "跳转到第二页",
        child: Container(
          child: Column(
            children: [
              CommonButton(text: "打开第二页", onPressed: () {
              /*  Navigator.push(context, MaterialPageRoute(builder: (context){
                return const SecondNavigatorRoute();
              }));*/
             Navigator.pop(context);
            }),
              const SizedBox(height: 20,),
              Text("接收${ModalRoute.of(context)?.settings.arguments.toString()??""}"),
              const SizedBox(height: 20,),
              CommonButton(text: "返回上一页", onPressed: () {

                Navigator.pop(context,"数据已经收到");
              })
            ],
        )));
  }
}
