import 'package:flutter/material.dart';
import 'package:flutterstudy/common/common_scaffold.dart';
import 'package:flutterstudy/home/custom_view/search_view/search_view.dart';

class SearchRoute extends StatefulWidget {
  const SearchRoute({Key? key}) : super(key: key);

  @override
  State createState() => _SearchRouteState();
}

class _SearchRouteState extends State<SearchRoute> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        title: ModalRoute.of(context)?.settings.arguments.toString() ?? '',
        child: Column(
          children: [
            SearchView(hintText: "您好",)
          ],
        ));
  }
}
