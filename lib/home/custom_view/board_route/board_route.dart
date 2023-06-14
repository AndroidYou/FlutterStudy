import 'package:flutter/material.dart';
import 'package:flutterstudy/common/common_scaffold.dart';

import 'custom_chess_board.dart';
import '../button/gradient_button.dart';
import '../button/turn_box.dart';
class BoardRoute extends StatefulWidget {
  const BoardRoute({Key? key}) : super(key: key);

  @override
  State createState() => _BoardRouteState();
}

class _BoardRouteState extends State<BoardRoute> {
  double double_turns = 0.0;
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(title: "画棋盘", child: Column(
      children: [
        const SizedBox(
          height: 40,
        ),


        const Text("画棋盘"),
        const CustomChessBoard(),
      ],
    ));
  }
}
