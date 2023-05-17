import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CustomFloatButton extends StatefulWidget {
  const CustomFloatButton({Key? key, required this.child,this.onTap}) : super(key: key);
  final Widget child;
   final GestureTapCallback? onTap;
  @override
  State createState() => _CustomFloatButtonState();
}

class _CustomFloatButtonState extends State<CustomFloatButton> {
  double _offsetLeft = 0.0;
  double _offsetTop = 0.0;
  late double  _screenWidth;
  late double _screenHeight;
  late double _selfWidth;
  late double _selfHeight;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      var selfSize = (context.findRenderObject() as RenderBox).size;
      _selfWidth = selfSize.width;
      _selfHeight = selfSize.height;
      Scaffold? scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
      print("object-->$_selfHeight, _offsetTop :$_offsetTop,_screenHeight:$_screenHeight ,scaffold:${scaffold?.appBar?.preferredSize.height},,top:${MediaQueryData.fromWindow(window).padding.top}");
      var appBarHeight = scaffold?.appBar?.preferredSize.height??0;
      _screenHeight = _screenHeight - appBarHeight - MediaQueryData.fromWindow(window).padding.top ;
    });
  }
  @override
  Widget build(BuildContext context) {
    var size  = MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height;

    return Positioned(
        left: _offsetLeft,
        top: _offsetTop,
        child: GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              _offsetLeft += details.delta.dx;
              _offsetTop += details.delta.dy;
              if (_offsetTop < 0) _offsetTop = 0;
              if (_offsetLeft < 0) _offsetLeft = 0;
              if(_offsetLeft+_selfWidth > _screenWidth) _offsetLeft = _screenWidth-_selfWidth;
              if(_offsetTop+_selfHeight > _screenHeight) _offsetTop = _screenHeight-_selfHeight;
            });
          },
          onTap:widget.onTap,
          child: widget.child,
        ));
  }
}
