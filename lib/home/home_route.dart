import 'package:flutter/material.dart';
import 'package:flutterstudy/home/custom_view/overlay_button/overlay_button.dart';
import 'package:flutterstudy/route/route_data.dart';
import 'package:flutterstudy/entry/route_bean.dart';

import 'custom_view/custom_float_button.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  State<StatefulWidget> createState() => _HomeRoute();
}

class _HomeRoute extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              RouteBean bean = RouteData.getElements()[index];
              return Padding(padding: const EdgeInsets.only(
                  top:10,left: 20,right: 20),child: Container(
                  constraints: const BoxConstraints(maxWidth: double.infinity,maxHeight: 60),
                  child: TextButton(
                    style:ButtonStyle(backgroundColor: MaterialStatePropertyAll(Theme.of(context).primaryColor)) ,
                    child: Text(
                      bean.name,
                      style: const TextStyle(fontSize: 20,color: Colors.white),
                    ),
                    onPressed: ()=>Navigator.pushNamed(context, bean.route,arguments:bean.name),
                  )
              ),);
            },
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 10,
                color: Color(0x1FF39090),
              );
            },
            itemCount: RouteData.getElements().length),
      //  CustomFloatButton(child: SizedBox(height: 50,width: 50,child: Container(color: Colors.red,),),top: 100,left: 300,),
        OverlayButton(child: SizedBox(height: 50,width: 50,child: Container(color: Colors.red,),),top: 100,left: 300,)
      ],
    );
  }
}
