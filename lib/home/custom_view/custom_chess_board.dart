import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomChessBoard extends StatelessWidget {
  const CustomChessBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 300),
      painter: MyCustomPainter(),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;

    ///画背景
    drawBg(canvas, rect);

    ///画棋盘
    drawBoard(canvas, rect);
    ///画棋子
    drawPiece(canvas,rect);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void drawBg(Canvas canvas, Rect rect) {
    var mPaint = Paint()
      ..color = Colors.orangeAccent
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    canvas.drawRect(rect, mPaint);
  }

  void drawBoard(Canvas canvas, Rect rect) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1
      ..color = Colors.black38;
    var widthSize = rect.width / 10;
    for (int i = 0; i <= 10; i++) {
      var dx = widthSize * i+rect.top;
      canvas.drawLine(Offset(dx, rect.top), Offset(dx, rect.bottom), paint);
    }
    var heightSize = rect.height / 10;
  //  print("height:$heightSize");
    for (int i = 0; i <= 10; i++) {
      var dy = heightSize * i+rect.left;
      canvas.drawLine(Offset(rect.left, dy), Offset(rect.right, dy), paint);
    }
  }

  void drawPiece(Canvas canvas, Rect rect) {
    var whitePaint = Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.white;
   // print("sisef:${rect.center.dx-20}");
    canvas.drawCircle( Offset(rect.center.dx-30, rect.center.dy), 10, whitePaint);

   whitePaint.color= Colors.black;
    canvas.drawCircle( Offset(rect.center.dx, rect.center.dy), 10, whitePaint);
  }
}
