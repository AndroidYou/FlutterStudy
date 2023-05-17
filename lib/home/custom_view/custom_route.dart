import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/common/common_button.dart';
import 'package:flutterstudy/common/common_scaffold.dart';
import 'package:flutterstudy/home/custom_view/custom_chess_board.dart';
import 'package:flutterstudy/home/custom_view/custom_float_button.dart';
import 'package:flutterstudy/home/custom_view/gradient_button.dart';
import 'package:flutterstudy/home/custom_view/gradient_circular_progress_route.dart';
import 'package:flutterstudy/home/custom_view/turn_box.dart';

class CustomViewRoute extends StatefulWidget {
  const CustomViewRoute({super.key});


  @override
  State<StatefulWidget> createState() =>_CustomViewRouteState();


}
class _CustomViewRouteState extends State<CustomViewRoute>{
  double double_turns = 0.0;
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        title: ModalRoute.of(context)?.settings.arguments.toString() ?? '',
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  GradientButton(
                    child: const Text("我是颜色渐变按钮"),
                    onTap: () {
                      print("我被点击了");
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TurnBox(
                    turns: double_turns,
                    speed: 200,
                    onTap: (){
                      setState(() {
                        double_turns+=0.1;
                      });
                    },
                    child: const Text('我是旋转按钮'),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text("画棋盘"),
                  const CustomChessBoard(),
                  CommonButton(text: "自定义进度条", onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const GradientCircularProgressRoute()));
                  })
                ],
              ),
            ),
            CustomFloatButton(child: SizedBox(height: 50,width: 50,child: Container(color: Colors.red,),))
          ],
        ));
  }
}
