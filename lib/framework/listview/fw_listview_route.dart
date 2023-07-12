import 'package:flutter/material.dart';
import 'package:flutterstudy/common/common_scaffold.dart';
class ListViewRoute extends StatefulWidget {
  const ListViewRoute({Key? key}) : super(key: key);

  @override
  State createState() => _ListViewRouteState();
}

class _ListViewRouteState extends State<ListViewRoute> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(title:ModalRoute.of(context)?.settings.arguments.toString() ?? '',
        child: Container());
  }
}
