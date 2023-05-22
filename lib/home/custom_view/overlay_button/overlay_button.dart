import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class OverlayButton extends StatefulWidget {
  const OverlayButton(
      {Key? key,
      required this.child,
      required this.parentKey,
      required this.initOffset,
      required this.onPressed,
      this.marginLeft,
      this.marginTop,
      this.marginBottom,
      this.marginRight,
      this.mass,
      this.stiffness,
      this.damping})
      : super(key: key);
  final Widget child; //子widget
  final Offset initOffset; //初始位置
  final GlobalKey parentKey; //父控件的key
  final VoidCallback onPressed; //点击事件
  final double? marginLeft; //外边距，距离左边
  final double? marginTop; //外边距，距离上边
  final double? marginRight; //外边距，距离右边
  final double? marginBottom; //外边距，距离下边
  final double? mass; //弹簧质量
  final double? stiffness; //弹簧系数
  final double? damping; //阻尼系数

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
  late double _mass;

  late double _stiffness;
  late double _damping;

  @override
  void initState() {
    super.initState();
    _mass = widget.mass ?? 20;
    _stiffness = widget.stiffness ?? 400;
    _damping = widget.damping ?? 0.75;
    _offsetLeft = widget.initOffset.dx;
    _offsetTop = widget.initOffset.dy;
    _offset = widget.initOffset;
    _animationController = AnimationController.unbounded(vsync: this);
    _animationController.addListener(() {
      _offset = _animation.value;
      setState(() {});
    });
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      var selfSize = (context.findRenderObject() as RenderBox).size;
      _selfWidth = selfSize.width;
      _selfHeight = selfSize.height;

      final RenderBox parentRenderBox =
      widget.parentKey.currentContext?.findRenderObject() as RenderBox;
      _screenHeight = parentRenderBox.size.height - (widget.marginBottom ?? 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _screenWidth = size.width;

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
          if (_offsetTop < 0) _offsetTop = 0 + (widget.marginTop ?? 0.0);
          if (_offsetLeft < 0) _offsetLeft = 0 + (widget.marginLeft ?? 0.0);
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
            _offsetLeft =
                _screenWidth - _selfWidth - (widget.marginRight ?? 0.0);
          } else {
            _offsetLeft = 0.00 + (widget.marginLeft ?? 0.0);
          }
          startAnimation(details.velocity.pixelsPerSecond, size);
        },
        onTap: widget.onPressed,
        child: widget.child,
      ),
    );
  }

  void startAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _animationController.drive(
        Tween<Offset>(begin: _offset, end: Offset(_offsetLeft, _offsetTop)));
    SpringSimulation simulation = SpringSimulation(
      SpringDescription(mass: _mass, stiffness: _stiffness, damping: _damping),
      0,
      1,
      -Offset(pixelsPerSecond.dx / size.width, pixelsPerSecond.dy / size.height)
          .distance,
    );
    _animationController.animateWith(simulation);
  }
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
