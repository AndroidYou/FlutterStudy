import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({super.key, required this.controller}) {
    height = Tween(begin: 0.0,end: 300.0).animate(CurvedAnimation(parent: controller, curve: const Interval(0.0,0.6)));
    color = ColorTween(begin: Colors.red,end: Colors.blue).animate(CurvedAnimation(parent: controller, curve:const Interval(0.0,0.6,curve: Curves.linear)));
    padding = EdgeInsetsTween(begin:const EdgeInsets.only(left: 0),end:const EdgeInsets.only(left: 250)).animate(CurvedAnimation(parent: controller, curve: const Interval(0.6,1)));
  }

  late final Animation<double> controller;
  late final Animation<double> height;
  late final Animation<Color?> color;
  late final Animation<EdgeInsets> padding;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: _animation);
  }
  Widget _animation(BuildContext context, Widget? child){
    return Container(
      alignment: Alignment.bottomLeft,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50,
        height: height.value,
      ),
    );
  }
}
