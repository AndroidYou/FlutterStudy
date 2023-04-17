import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutterstudy/animation/custom_animation_route.dart';
import 'package:flutterstudy/animation/hero_route.dart';
import 'package:flutterstudy/animation/rotation_route.dart';
import 'package:flutterstudy/animation/stagger_route.dart';
import 'package:flutterstudy/common/common_button.dart';

class AnimationRoute extends StatefulWidget {
  const AnimationRoute({super.key});

  @override
  State<StatefulWidget> createState() => _AnimationRoute();
}

class _AnimationRoute extends State<AnimationRoute>
    with SingleTickerProviderStateMixin {
  final String imageUrl =
      "https://img2.baidu.com/it/u=3344911223,3409692090&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=313";
  late AnimationController _controller;
  late Animation<double> _animation;
  late double animation = 0.0;
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    //使用弹性曲线
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceIn);
    _animation = Tween(begin: 0.0, end: 300.0).animate(_animation)
      ..addListener(() {
        setState(() {
          print("value值：${_animation.value}");
          animation = _animation.value;
        });
      });

    /* _rotationController =
        AnimationController(duration: const Duration(milliseconds:500 ), vsync: this);
    _rotationAnimation = Tween(begin: 0.0,end: 1.0).animate(_rotationController);*/
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.network(
            imageUrl,
            width: animation,
            height: animation,
          ),
          CommonButton(
              text: "点击开始执行动画",
              onPressed: () {
                _controller.reset();
                _controller.forward();
              }),
          CommonButton(
              text: "淡入淡出路由切换动画",
              onPressed: () {
                Navigator.push(context, RotationRote(builder: (context) {
                  return const CustomAnimationRoute();
                }));
              }),
          CommonButton(
              text: "旋转路由切换动画",
              onPressed: () => Navigator.push(
                  context,
                  RotationRote(
                      builder: (context) => const CustomAnimationRoute()))),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            child: Hero(
              tag: "hero",
              child: ClipOval(
                child: Image.network(
                  "https://up.36992.com/22/38/c3/5f/593761d84701b1d873379e7c6f4fa5c1.jpg",
                  width: 80,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HeroRoute()));
            },
          ),
          CommonButton(
              text: "交织动画",
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StaggerRoute()))),
          const SizedBox(height: 40,),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Text("$_count",style: const TextStyle(fontSize: 20),key: ValueKey<int>(_count),),
            transitionBuilder: (child, animation) {
              ///缩放动画
              return ScaleTransition(scale: animation, child: child);
             // return SizeTransition(sizeFactor: animation,child: child,);

            },
          ),
          CommonButton(text: "点击增加数字", onPressed: () {
            setState(() {
              _count++;
            });
          })
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
