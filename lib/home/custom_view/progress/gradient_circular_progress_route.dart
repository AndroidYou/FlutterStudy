import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/common/common_scaffold.dart';
import 'package:flutterstudy/home/custom_view/progress/gradient_circular_progress_indicator.dart';
import 'package:flutterstudy/home/custom_view/progress/horizontal_progress_bar.dart';

class GradientCircularProgressRoute  extends StatefulWidget{
  const GradientCircularProgressRoute({super.key});

  @override
  State<StatefulWidget> createState() =>_GradientCircularProgressRouteState();

}
class _GradientCircularProgressRouteState extends State<GradientCircularProgressRoute> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  @override
  void initState() {
  _controller = AnimationController(vsync: this,lowerBound: 0,upperBound:1, duration: const Duration(seconds: 5));
   _controller.forward();
    super.initState();
  }
  @override
  void dispose() {
   _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return CommonScaffold(title: '自定义进度条', child: Center(
     child: AnimatedBuilder(
       builder: (context,child){
         return Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             GradientCircularProgressIndicator(value: _controller.value, radius: 50, strokeWidth: 6, colors: const [Colors.red,Colors.orange,Colors.yellow],strokeCapRound: true,),
             SizedBox(height: 40,),
             HorizontalProgressBar(value: _controller.value,),
           ],
         );
       }, animation: _controller,
     ),
   ));
  }

}