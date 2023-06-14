import 'dart:math';

import 'package:flutter/material.dart';

class GradientCircularProgressIndicator extends StatelessWidget {
  const GradientCircularProgressIndicator({
    super.key,
    required this.value,
    required this.radius,
    required this.colors,
    this.strokeCapRound = false,
    this.backGroundColor =  Colors.grey,
    this.totalAngle = 2 * pi,
    this.strokeWidth = 2.0,
  });

  ///当前进度  取值范围[0.0->1.0]
  final double value;

  ///圆的半径
  final double radius;

  ///圆环的粗细
  final double strokeWidth;

  ///两端是否为圆角
  final bool strokeCapRound;

  ///
  final Color backGroundColor;

  /// 进度条的总弧度 2*PI为整圆
  final double totalAngle;

  /// 渐变色的数组
  final List<Color> colors;

  /// 渐变色的终点，对应colors属性
  // final List<double> stops;

  @override
  Widget build(BuildContext context) {
    print("radius:$value");
    double _offset = .0;
    if (strokeCapRound) {
      _offset = asin(strokeWidth / (radius * 2 - strokeWidth));
    }
    var _colors = colors;
    _colors ??= [
      Theme.of(context).primaryColorLight,
      Theme.of(context).cardColor
    ];
    return Transform.rotate(
      angle: -pi,
      child: CustomPaint(
        size: Size.fromRadius(radius),
        painter: _GradientCircularProgressIndicator(
            value: value,
            radius: radius,
            strokeWidth: strokeWidth,
            strokeCapRound : strokeCapRound,
            backGroundColor : backGroundColor,
            totalAngle : totalAngle,
            colors : _colors,

        ),
      ),
    );
  }
}

class _GradientCircularProgressIndicator extends CustomPainter {
  _GradientCircularProgressIndicator(
      {required this.value, required this.radius, required this.strokeWidth,
       required this.strokeCapRound , required this.backGroundColor,
        required this.totalAngle,required this.colors

      });

  final double value;
  final double radius;
  final double strokeWidth;
  ///两端是否为圆角
  final bool strokeCapRound;

  ///
  final Color backGroundColor;

  /// 进度条的总弧度 2*PI为整圆
  final double totalAngle;

  /// 渐变色的数组
  final List<Color> colors;
  @override
  void paint(Canvas canvas, Size size) {

    if(radius !=null){
      size = Size.fromRadius(radius);
    }
    double _offset = strokeWidth /2.0;
    double _value = (value ??.0);
    _value = _value.clamp(.0,1.0)*totalAngle;
    double _start = 0;
    if(strokeCapRound){
      _start = asin(strokeWidth/(size.width-strokeWidth));
    }



    var rect = Offset(_offset,_offset) & Size(size.width-strokeWidth, size.height - strokeWidth);
  //  var rect = Offset.zero & size;
    var paint = Paint()
      ..strokeWidth = strokeWidth
      ..strokeCap = strokeCapRound?StrokeCap.round:StrokeCap.butt
      ..color = Colors.grey
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke;

    print("totalAngle:${backGroundColor !=Colors.transparent}");
    print("totalAngle:${_start},${rect.height}");
    if(backGroundColor !=Colors.transparent){
      paint.color = backGroundColor;
      canvas.drawArc(rect, _start,totalAngle, false, paint);
    }
    if(_value>0){
      paint.shader = SweepGradient(colors: colors,startAngle: 0.0,endAngle: _value,stops: [0.3,0.6,0.8]).createShader(rect);
      canvas.drawArc(rect, _start, _value, false, paint);
    }


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
