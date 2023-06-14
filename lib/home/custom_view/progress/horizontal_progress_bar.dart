
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalProgressBar extends StatelessWidget{
  const HorizontalProgressBar({super.key,required this.value});
  final  double value;
  @override
  Widget build(BuildContext context) {
   return CustomPaint(
       size: const Size(double.infinity, 20),
       painter: _HorizontalProgressBar(value: value),
   );
  }
}
class _HorizontalProgressBar extends CustomPainter{
  _HorizontalProgressBar({ required this.value});
  final double value;
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    var paint = Paint()
    ..color = Colors.grey
    ..isAntiAlias = true
      ..strokeWidth = 4
    ..style = PaintingStyle.fill;
    List<Color> colors = [Colors.blue,Colors.red,Colors.orange];

    canvas.drawLine(Offset(rect.left, rect.height), Offset(rect.right, rect.height), paint);

    paint.shader = LinearGradient(colors: colors).createShader(rect);
    double totalProgress = rect.right-rect.left;
    double currentProgress = value* totalProgress;
    canvas.drawLine(Offset(rect.left, rect.height),Offset(rect.left+currentProgress-6, rect.height) ,paint);

    var circlePaint = Paint()
    ..isAntiAlias = true
    ..style = PaintingStyle.fill
    ..color = Colors.blue;

    canvas.drawCircle(Offset(rect.left+currentProgress-6, rect.height), 6, circlePaint);









  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}