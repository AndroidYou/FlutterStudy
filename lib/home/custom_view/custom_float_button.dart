import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CustomFloatButton extends StatefulWidget {
  const CustomFloatButton({Key? key, required this.child,this.onTap,
    this.left,
    this.top,
   }) : super(key: key);
  final Widget child;
   final GestureTapCallback? onTap;
  final double? left;
  final double? top;

  @override
  State createState() => _CustomFloatButtonState();
}

class _CustomFloatButtonState extends State<CustomFloatButton> {
  //Offset _offset = const Offset(200, 200);
  late double  _screenWidth;
  late double _screenHeight;
  late double _selfWidth =0.0;
  late double _selfHeight =0.0;
  late double _offsetLeft;
  late double _offsetTop;

  @override
  void initState() {
    super.initState();
     _offsetLeft = widget.left??0.0;
     _offsetTop = widget.left??0.0;

   /*SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      var selfSize = (context.findRenderObject() as RenderBox).size;
      _selfWidth = selfSize.width;
      _selfHeight = selfSize.height;
      Scaffold? scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
   //   print("object-->$_selfHeight, _offsetTop :$_offsetTop,_screenHeight:$_screenHeight ,scaffold:${scaffold?.appBar?.preferredSize.height},,top:${MediaQueryData.fromWindow(window).padding.top}");
      var appBarHeight = scaffold?.appBar?.preferredSize.height??0;
      //_screenHeight = _screenHeight - appBarHeight - MediaQueryData.fromWindow(window).padding.top ;
    });*/
  }
@override
  void didUpdateWidget(covariant CustomFloatButton oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    var selfSize = (context.findRenderObject() as RenderBox).size;
    _selfWidth = selfSize.width;
    _selfHeight = selfSize.height;
   /* Scaffold? scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
    var appBarHeight = scaffold?.appBar?.preferredSize.height??0;*/
 //   _screenHeight = _screenHeight - appBarHeight - MediaQueryData.fromWindow(window).padding.top ;

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
            print("当前位置:${details.delta.dx}, dy:${details.delta.dy}");
            setState(() {
              _offsetTop += details.delta.dy;
              _offsetLeft+= details.delta.dx;
              if (_offsetTop < 0) _offsetTop = 0;
              if (_offsetLeft < 0) _offsetLeft = 0;
              if(_offsetLeft+_selfWidth > _screenWidth) _offsetLeft = _screenWidth-_selfWidth;
              if(_offsetTop+_selfHeight > _screenHeight) _offsetTop = _screenHeight-_selfHeight;
            });
          },
          onPanEnd: (DragEndDetails details){
               setState(() {
                 if(_offsetLeft >_screenWidth/2){
                   _offsetLeft = _screenWidth-_selfWidth;
                 }else{
                   _offsetLeft = 0.0;
                 }
               });
          },
          onTap:widget.onTap,
          child: widget.child
          ),
        );
  }
}
