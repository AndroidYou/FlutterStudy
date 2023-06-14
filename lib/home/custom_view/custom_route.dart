import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterstudy/common/common_button.dart';
import 'package:flutterstudy/common/common_scaffold.dart';
import 'package:flutterstudy/home/custom_view/board_route/board_route.dart';
import 'package:flutterstudy/home/custom_view/button/gradient_button.dart';
import 'package:flutterstudy/home/custom_view/progress/gradient_circular_progress_route.dart';
import 'package:flutterstudy/home/custom_view/step/StepView.dart';
import 'package:flutterstudy/home/custom_view/step/step_route.dart';
import 'package:flutterstudy/home/custom_view/button/turn_box.dart';
import 'package:flutterstudy/home/custom_view/overlay/OverlayManager.dart';
import 'package:flutterstudy/route/route_data.dart';

import 'button/button_route.dart';
import 'navigation/navigation_route.dart';

class CustomViewRoute extends StatefulWidget {
  const CustomViewRoute({super.key});

  @override
  State<StatefulWidget> createState() => _CustomViewRouteState();
}

class _CustomViewRouteState extends State<CustomViewRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        title: ModalRoute.of(context)?.settings.arguments.toString() ?? '',
        child: GridView.count(
          crossAxisCount: 3,
          children: RouteData.getCustoms().map((e) {
            return  GestureDetector(
                onTap: (){
              Navigator.pushNamed(context, e.route,arguments: e.name);},
            child:
              Container(
              decoration: const BoxDecoration(
                //设置边框，右边和下边
                  border: Border(
                    top: BorderSide.none,
                    bottom:
                    BorderSide(width: 1, color: Colors.blue),
                    left: BorderSide.none,
                    right:
                    BorderSide(width: 1, color: Colors.blue),
                  )),
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.map, color:Colors.blue),
                   SizedBox(height: 20,),
                   Text(e.name,
                        style: const TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
            )
            );
          }).toList(),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
