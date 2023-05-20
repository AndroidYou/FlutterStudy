import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CustomOverlay extends StatefulWidget {
  const CustomOverlay({Key? key,required this.child}) : super(key: key);
  final Widget child;

  @override
  State<StatefulWidget> createState() =>CustomOverlayState();

}
class CustomOverlayState extends State<CustomOverlay>{
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context,tr){
      SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      //  showFloating(context);
      });

    //  showFloating(context);
      return widget.child;
    });
  }
  @override
  void dispose() {
   // hideFloating();
    super.dispose();
  }
}

bool show = false;
Offset offset = const Offset(200, 200);

const double radius = 60;

var entry = OverlayEntry(
    builder: (context) => Stack(
      children: <Widget>[
        Positioned(
          left: offset.dx,
          top: offset.dy,
          child: _buildFloating(),
        ),
      ],
    ));

///绘制悬浮控件
_buildFloating() => GestureDetector(
    onPanDown: (details) {
      offset = details.globalPosition - const Offset(radius / 2, radius / 2);
      entry.markNeedsBuild();
    },
    onPanUpdate: (DragUpdateDetails details) {
      offset = offset + details.delta;
      entry.markNeedsBuild();
    },
    onLongPress: hideFloating,
    child: Container(
      height: radius,
      width: radius,
      alignment: Alignment.center,
      color: Colors.red,

    ));

showFloating(BuildContext context) {
  if (!show) {
    Overlay.of(context)?.insert(entry);
    show = true;
  }
}

hideFloating() {
  if (show) {
    entry.remove();
    show = false;
  }
}
