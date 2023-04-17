import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget{
  const GradientButton({super.key,this.onTap,required this.child,this.height,this.width});
  final GestureTapCallback? onTap;
  final Widget child;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [Theme.of(context).primaryColor,Theme.of(context).primaryColorLight];
    return DecoratedBox(decoration: BoxDecoration(
      gradient:LinearGradient(colors: colors),
      borderRadius: BorderRadius.circular(10),
    ),
      child:Material(
        type: MaterialType.transparency, //按压时覆盖在DecorationBox上显示颜色
    child:  InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.red,
      onTap:  onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        constraints: BoxConstraints.tightFor(width: width ,height: height),
        padding: const EdgeInsets.all(10),
        child:child,

      ),
    ),),
    );
  }

}
