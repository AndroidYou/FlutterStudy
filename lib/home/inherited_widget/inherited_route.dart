import 'package:flutter/material.dart';
import 'package:flutterstudy/home/inherited_widget/car_model.dart';
import 'package:flutterstudy/home/inherited_widget/change_notifier_provider.dart';
import 'package:flutterstudy/home/inherited_widget/custom_wiget.dart';
import 'package:flutterstudy/home/inherited_widget/inherited_widget.dart';
import 'car_model.dart';

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
        title: const Text("Inherited共享数据"),
      ),
      body: ChangeNotifierProvider(data: CarModel(), child: Builder(builder: (context){
    return Column( children: [
    SizedBox(
    height:80,child: CustomWidget<CarModel>(
    builder: (context, mode) => Text('总数：${mode?.totalCount}'),
    ),),
    const SizedBox(
    height: 40,
    ),
    ElevatedButton(onPressed: (){
    ChangeNotifierProvider.of<CarModel>(context, false).items.add(10);
    }, child: Text('增加数字'))

    ],);
    /* ShareDataWidget(
        data: _count,
        child: Center(
          child:Column(
            children: [
              *//*  Container(
                height: 150,
                width: 150,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(borderRadius:BorderRadius.all(Radius.circular(20)),image:DecorationImage(
                  image: "1" =="1" ?NetworkImage("https://lmg.jj20.com/up/allimg/1114/050R1105319/21050Q05319-1-1200.jpg") : NetworkImage("https://img1.baidu.com/it/u=413643897,2296924942&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500"),fit: BoxFit.cover
                ) ,shape: BoxShape.rectangle),),*//*
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
      )*/
    }))
    );
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
