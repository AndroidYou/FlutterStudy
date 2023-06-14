import 'package:flutter/material.dart';
import 'package:flutterstudy/common/common_scaffold.dart';

import 'gradient_button.dart';
import 'turn_box.dart';
class ButtonRoute extends StatefulWidget {
  const ButtonRoute({Key? key}) : super(key: key);

  @override
  State createState() => _ButtonRouteState();
}

class _ButtonRouteState extends State<ButtonRoute> {
  double double_turns = 0.0;
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(title: "按钮", child: Column(
      children: [
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
      ],
    ));
  }
}
