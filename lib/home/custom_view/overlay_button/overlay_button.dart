import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';


class OverlayButton extends StatefulWidget {
  const OverlayButton({
    Key? key,
    required this.child,
    this.left,
    this.top,
  }) : super(key: key);
  final Widget child;
  final double? left;
  final double? top;

  @override
  State createState() => _OverlayButtonState();
}

class _OverlayButtonState extends State<OverlayButton>
    with SingleTickerProviderStateMixin {
  late double _offsetLeft;
  late double _offsetTop;
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  late Offset _offset;
  late double _screenWidth;
  late double _screenHeight;
  late double _selfWidth = 0.0;
  late double _selfHeight = 0.0;

  @override
  void initState() {
    super.initState();
    _offsetLeft = widget.left ?? 0.0;
    _offsetTop = widget.left ?? 0.0;
    _offset = Offset(_offsetLeft, _offsetTop);
    _animationController = AnimationController.unbounded(vsync: this);
    _animationController.addListener(() {
      _offset = _animation.value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height;
    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: GestureDetector(
        onPanStart: (DragStartDetails details) {
          _animationController.stop(canceled: true);
        },
        onPanUpdate: (DragUpdateDetails details) {
          _offset += Offset(details.delta.dx, details.delta.dy);
          _offsetTop += details.delta.dy;
          _offsetLeft += details.delta.dx;
          if (_offsetTop < 0) _offsetTop = 0;
          if (_offsetLeft < 0) _offsetLeft = 0;
          if (_offsetLeft + _selfWidth > _screenWidth) {
            _offsetLeft = _screenWidth - _selfWidth;
          }
          if (_offsetTop + _selfHeight > _screenHeight) {
            _offsetTop = _screenHeight - _selfHeight;
          }
          setState(() {});
        },
        onPanEnd: (DragEndDetails details) {
          if (_offsetLeft > _screenWidth / 2 - _selfWidth / 2) {
            _offsetLeft = _screenWidth - _selfWidth;
          } else {
            _offsetLeft = 0.0;
          }
          startAnimation(details.velocity.pixelsPerSecond, size);
        },
        child: widget.child,
      ),
    );
  }

  void startAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _animationController.drive(
        Tween<Offset>(begin: _offset, end: Offset(_offsetLeft, _offsetTop)));
    SpringSimulation simulation = SpringSimulation(
      const SpringDescription(mass: 20, stiffness: 400, damping: 0.75),
      0,
      1,
      -Offset(pixelsPerSecond.dx / size.width, pixelsPerSecond.dy / size.height)
          .distance,
    );
    _animationController.animateWith(simulation);
  }

  @override
  void didUpdateWidget(covariant OverlayButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    var selfSize = (context.findRenderObject() as RenderBox).size;
    _selfWidth = selfSize.width;
    _selfHeight = selfSize.height;
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
