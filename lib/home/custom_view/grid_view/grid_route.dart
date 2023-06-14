import 'package:flutter/material.dart';
import 'package:flutterstudy/common/common_scaffold.dart';
import 'package:flutterstudy/home/custom_view/swiper/LinearLayout.dart';

class GridRoute extends StatelessWidget {
  GridRoute({Key? key}) : super(key: key);
  var list = [1, 2, 3, 5, 4];

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        title: ModalRoute.of(context)?.settings.arguments.toString() ?? '',
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: LinearLayout(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: list.map((e) {
                    return Container(
                      height: 50,
                      width: 50,
                      color: Colors.red,
                    );
                  }).toList()),
            )
          ],
        ));
  }
}
