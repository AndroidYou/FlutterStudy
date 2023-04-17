import 'package:flutter/cupertino.dart';
import 'package:flutterstudy/common/common_scaffold.dart';

class CustomAnimationRoute extends StatefulWidget{
  const CustomAnimationRoute({super.key});
  @override
  State<StatefulWidget> createState() => _CustomAnimationRoute();
}
class _CustomAnimationRoute extends State<CustomAnimationRoute>{
  @override
  Widget build(BuildContext context) {
   return CommonScaffold(title: "自定义路由切换动画", child: Container());
  }
}