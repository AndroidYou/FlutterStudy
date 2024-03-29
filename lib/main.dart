import 'package:flutter/material.dart';
import 'package:flutterstudy/animation/animation_route.dart';
import 'package:flutterstudy/route/route_data.dart';
import 'package:flutterstudy/route/route_names.dart';
import 'package:flutterstudy/home/home_route.dart';
import 'package:flutterstudy/others/channel/basic_message_channel.dart';
import 'package:flutterstudy/others/channel/event_channel_route.dart';
import 'package:flutterstudy/others/channel/method_channel_route.dart';
import 'package:flutterstudy/others/other_route.dart';
import 'package:flutterstudy/route/route_utils.dart';

import 'framework/main/framework_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: RouteUtils.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Study',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      routes: RouteData.initRoutes(context),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List _titles = ['控件', '动画', '框架', '其他'];
  final List<Widget> _pages = [
    const HomeRoute(),
    const AnimationRoute(),
    const FrameWorkRoute(),
    const OtherRoute()
  ];
   late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _counter);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(_titles[_counter]),
      ),
      body: PageView(controller: _controller,physics: const NeverScrollableScrollPhysics(),children: _pages,),
      bottomNavigationBar: BottomNavigationBar(
        items: _itemBar(),
        currentIndex: _counter,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _counter = index;
            _controller.jumpToPage(index);
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {},
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _itemBar() {
    List<BottomNavigationBarItem> list = [];
    list.add(
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: '控件'));
    list.add(const BottomNavigationBarItem(
        icon: Icon(Icons.animation), label: '动画'));
    list.add(const BottomNavigationBarItem(
        icon: Icon(Icons.filter_frames), label: '框架'));
    list.add(const BottomNavigationBarItem(
        icon: Icon(Icons.devices_other), label: '其他'));
    return list;
  }
}
