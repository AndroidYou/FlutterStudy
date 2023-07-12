import 'package:flutter/material.dart';
import 'package:flutterstudy/entry/route_bean.dart';
import 'package:flutterstudy/route/route_data.dart';
import 'package:flutterstudy/route/route_utils.dart';

/// 框架主页
class FrameWorkRoute extends StatefulWidget {
  const FrameWorkRoute({Key? key}) : super(key: key);

  @override
  State createState() => _FrameWorkRouteState();
}

class _FrameWorkRouteState extends State<FrameWorkRoute> {
  @override
  Widget build(BuildContext context) {
    return GridView(gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    children: RouteData.getFrameWork().map((e) => _itemWidget(e)).toList(),);
  }
  Widget _itemWidget(RouteBean routeBean){
    return Container(

      decoration:const BoxDecoration(
        border: Border(top: BorderSide.none,bottom: BorderSide(width: 1,color: Colors.blue),
        left: BorderSide.none,right: BorderSide(width: 1,color: Colors.blue)),
      ),
      child: GestureDetector(
        onTap: (){
           RouteUtils.pushName(routeBean.route,arguments: routeBean.name);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.list_alt,color:Colors.blue,),
           const SizedBox(height: 10,),
            Text(routeBean.name,style: const TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }

}
