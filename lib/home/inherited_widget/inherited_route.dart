import 'package:flutter/material.dart';
import 'package:flutterstudy/home/inherited_provider/car_model.dart';
import 'package:flutterstudy/home/inherited_provider/change_notifier_provider.dart';
import 'package:flutterstudy/home/inherited_provider/custom_wiget.dart';
import 'package:flutterstudy/home/inherited_provider/inherited_provider.dart';
import 'package:flutterstudy/home/inherited_widget/inherited_widget.dart';
import '../inherited_provider/car_model.dart';

class InheritedRoute extends StatefulWidget {
  const InheritedRoute({super.key});

  @override
  State<StatefulWidget> createState() => _InheritedRoute();
}

class _InheritedRoute extends State<InheritedRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text(ModalRoute.of(context)?.settings.arguments.toString()??''),
        ),
        body: ShareDataWidget(
          data: _count,
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 150,
                  width: 150,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          image: "1" == "1"
                              ? NetworkImage(
                                  "https://lmg.jj20.com/up/allimg/1114/050R1105319/21050Q05319-1-1200.jpg")
                              : NetworkImage(
                                  "https://img1.baidu.com/it/u=413643897,2296924942&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500"),
                          fit: BoxFit.cover),
                      shape: BoxShape.rectangle),
                ),
                const SizedBox(
                  height: 40,
                ),
                const TextTest(),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () => setState(() => _count++),
                    child: const Text('add')),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ));
  }
}

class TextTest extends StatefulWidget {
  const TextTest({super.key});

  @override
  State<StatefulWidget> createState() => _TextTest();
}

class _TextTest extends State<TextTest> {
  @override
  Widget build(BuildContext context) {
    return Text('计数：${ShareDataWidget.of(context)?.data}');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
