import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterstudy/common/common_button.dart';
import 'package:flutterstudy/common/common_scaffold.dart';
import 'package:flutterstudy/home/custom_view/CustomOverlay.dart';
import 'package:flutterstudy/home/custom_view/custom_chess_board.dart';
import 'package:flutterstudy/home/custom_view/custom_float_button.dart';
import 'package:flutterstudy/home/custom_view/gradient_button.dart';
import 'package:flutterstudy/home/custom_view/gradient_circular_progress_route.dart';
import 'package:flutterstudy/home/custom_view/step/StepView.dart';
import 'package:flutterstudy/home/custom_view/step/step_route.dart';
import 'package:flutterstudy/home/custom_view/turn_box.dart';
import 'package:flutterstudy/home/custom_view/overlay/OverlayManager.dart';

class CustomViewRoute extends StatefulWidget {
  const CustomViewRoute({super.key});

  @override
  State<StatefulWidget> createState() => _CustomViewRouteState();
}

class _CustomViewRouteState extends State<CustomViewRoute> {
  double double_turns = 0.0;

  @override
  void initState() {
    super.initState();
  }

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
                  onTap: () {
                    setState(() {
                      double_turns += 0.1;
                    });
                  },
                  child: const Text('我是旋转按钮'),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text("画棋盘"),
                const CustomChessBoard(),
                CommonButton(
                    text: "自定义进度条",
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const GradientCircularProgressRoute()));
                    }),
                CommonButton(
                    text: "Step步骤条",
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                          const StepViewRoute()));
                    }),
              // StepView(type: StepType.vertical,linesHeight: 40,linesWidth: 2, finishedIcon: Image.asset("images/icon_chose.png"), unfinishedIcon: Image.asset("images/icon_unchose.png"),)
              ],
            ),
          ),
          CustomFloatButton(

            top: 100,
            left: 300,
            child: SizedBox(
              height: 50,
              width: 50,
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    OverlayManager.getInstance().hideOverlay();
    super.dispose();
  }
}
