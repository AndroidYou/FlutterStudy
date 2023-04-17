import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/animation/stagger_animation.dart';
import 'package:flutterstudy/common/common_button.dart';
import 'package:flutterstudy/common/common_scaffold.dart';

class StaggerRoute extends StatefulWidget {
  const StaggerRoute({super.key});

  @override
  State<StatefulWidget> createState() => _StaggerRoute();
}

class _StaggerRoute extends State<StaggerRoute> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
   _controller = AnimationController(vsync: this,duration: const Duration(seconds: 2));
    super.initState();
  }
  _playAnimation() async{
    try{
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    }catch(e){

    }

  }
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        title: "StaggerAnimation",
        child: Center(
          child: Column(
            children: [CommonButton(text: "点击开始执行交织动画", onPressed: () {
               _playAnimation();
            }),
             Container(
               height: 300,
               width: 300,
               decoration: const BoxDecoration(color: Colors.grey),
               child:  StaggerAnimation(controller: _controller),
             )
            ],
          ),
        ));
  }
}
