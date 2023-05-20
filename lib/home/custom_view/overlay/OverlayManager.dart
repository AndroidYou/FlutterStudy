import 'package:flutter/widgets.dart';

class OverlayManager {
  OverlayEntry? _overlayEntry;
  static final OverlayManager _instance = OverlayManager._privateConstructor();

  OverlayManager._privateConstructor();

  static OverlayManager getInstance() {
    return _instance;
  }

  showOverlay(BuildContext context, Widget child) {
    assert(context != null);
    _overlayEntry = _createEntry(child);
    Overlay.of(context).insert(_overlayEntry!);
  }
  hideOverlay(){
    if(_overlayEntry !=null){
      _overlayEntry!.remove();
    }
  }
  Offset offset = const Offset(50, 50);
  OverlayEntry? _createEntry(Widget widget) {
    if (_overlayEntry != null) {
      if (_overlayEntry!.mounted) {
        _overlayEntry!.remove();
      }
    }
   _overlayEntry = OverlayEntry(builder: (context) => Stack(
    children: <Widget>[
    Positioned(
      left: offset.dx,
      top: offset.dy,
    child: GestureDetector(
      onPanDown: (details) {
        offset = details.globalPosition ;
        _overlayEntry!.markNeedsBuild();
      },
      onPanUpdate: (DragUpdateDetails details) {
        offset = offset + details.delta;
        _overlayEntry!.markNeedsBuild();
      },
      child: widget,

    ),
    ),
    ],
    ));
    return _overlayEntry;
  }

}
