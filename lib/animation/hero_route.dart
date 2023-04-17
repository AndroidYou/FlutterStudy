import 'package:flutter/cupertino.dart';
import 'package:flutterstudy/common/common_scaffold.dart';

class HeroRoute extends StatelessWidget{
  const HeroRoute({super.key});

  @override
  Widget build(BuildContext context) {
   return CommonScaffold(title: "Hero动画", child: Center(
     child:Hero(
       tag: "hero",
       child: Image.network("https://up.36992.com/22/38/c3/5f/593761d84701b1d873379e7c6f4fa5c1.jpg"),
     ) ,
   ));
  }

}