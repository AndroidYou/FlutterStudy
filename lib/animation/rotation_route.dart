import 'package:flutter/material.dart';

class RotationRote extends PageRoute{
  RotationRote({required this.builder});
  final WidgetBuilder builder;

  @override

  Color? get barrierColor => Colors.grey;

  @override

  String? get barrierLabel => "throw UnimplementedError()";

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context);
  }
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {

    return RotationTransition(turns: animation,child: builder(context),);
  }

  @override

  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 800) ;

}
