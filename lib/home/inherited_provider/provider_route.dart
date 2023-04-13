import 'package:flutter/material.dart';
import 'package:flutterstudy/home/inherited_provider/car_model.dart';
import 'package:flutterstudy/home/inherited_provider/change_notifier_provider.dart';
import 'package:flutterstudy/home/inherited_provider/custom_wiget.dart';
import 'package:flutterstudy/home/inherited_provider/inherited_provider.dart';
import 'package:flutterstudy/home/inherited_widget/inherited_widget.dart';
import '../inherited_provider/car_model.dart';

class ProviderRoute extends StatefulWidget {
  const ProviderRoute({super.key});

  @override
  State<StatefulWidget> createState() => _ProviderRoute();
}

class _ProviderRoute extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text(ModalRoute.of(context)?.settings.arguments.toString()??''),
        ),
        body: ChangeNotifierProvider<CarModel>(
            data: CarModel(),
            child: Builder(builder: (context) {
              return Center(child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Builder(builder: (context) {
                    var cart =
                    ChangeNotifierProvider.of<CarModel>(context, false);
                    return Text("计算结果:${cart.totalCount}");
                  }),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ChangeNotifierProvider.of<CarModel>(context, false)
                            .addNum(10);
                      },
                      child: const Text('增加数字'))
                ],
              ),);
            })));
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
