import 'package:flutter/material.dart';
import 'package:flutterstudy/common/common_button.dart';
import 'package:flutterstudy/common/common_scaffold.dart';
import 'package:flutterstudy/home/navigator/second_navigator_route.dart';
import 'package:flutterstudy/route/route_names.dart';

class FirstNavigatorRoute extends StatelessWidget {
  const FirstNavigatorRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        title: ModalRoute.of(context)?.settings.arguments?.toString() ?? "",
        child: Container(
          child: Column(
            children: [CommonButton(text: "打开第二页", onPressed: () {
            /*  Navigator.push(context, MaterialPageRoute(builder: (context){
                return const SecondNavigatorRoute();
              }));*/
              Navigator.pushNamed(context, "/second_navigator_route" );
            }),

             const SizedBox(height: 20,),
              CommonButton(text: "传值给第三页", onPressed: ()async{
              var result  =  await  Navigator.pushNamed(context, "/second_navigator_route",
                    arguments: "Hello,我是来自首页的数据" );
              print("接收返回数据:$result");
              })],

          ),
        ));
  }
}
