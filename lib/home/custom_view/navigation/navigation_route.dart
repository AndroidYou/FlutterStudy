import 'package:flutter/material.dart';
import 'package:flutterstudy/common/common_scaffold.dart';
import 'package:flutterstudy/home/custom_view/navigation/navigation_view.dart';

class NavigationRoute extends StatelessWidget {
  const NavigationRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        title: "导航组件",
        child: Column(
          children: const [
            SizedBox(
              height: 40,
            ),
            NavigationView(
              list: [1, 2, 3],
              currentIndex: 1,
              lineWidth: 108,
            )
          ],
        ));
  }
}
