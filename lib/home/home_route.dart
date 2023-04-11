import 'package:flutter/material.dart';
import 'package:flutterstudy/common/route_data.dart';
import 'package:flutterstudy/entry/route_bean.dart';

class HomeRoute extends StatefulWidget{
  const HomeRoute({super.key});

  @override
  State<StatefulWidget> createState()=>_HomeRoute();
}
class _HomeRoute extends State<HomeRoute>{

  @override
  Widget build(BuildContext context) {
   return ListView.separated(itemBuilder: (BuildContext context,int index){
     RouteBean bean = RouteData.getElements()[index];
     return SizedBox(height: 80,child: Center(child: GestureDetector(onTap: (){
       Navigator.pushNamed(context, bean.route);
     },child: Text(bean.name,style: const TextStyle(fontSize: 20),),)));
   }, separatorBuilder: (context,index){
     return const Divider(thickness: 10,color: Color(0x1FF39090),);
   }, itemCount: RouteData.getElements().length);
  }

}
