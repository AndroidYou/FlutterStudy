import 'package:flutter/cupertino.dart';

class InheritedProvider<T> extends InheritedWidget{
  const InheritedProvider({super.key, required Widget child,required this.data}):super(child: child);
  final T data;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {

   return true;
  }

}