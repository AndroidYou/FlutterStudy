import 'package:flutter/cupertino.dart';

class ShareDataWidget extends InheritedWidget{
  const ShareDataWidget({super.key, required super.child,required this.data});
  final int data; //在子树中共享的数据

  //定义一个方法，提供共享数据给子树使用

  static ShareDataWidget? of(BuildContext context){

    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();//调用子控件的didChangeDependencies
   // return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>()!.widget as ShareDataWidget; //不会调用didChangeDependencies

  }
  //当回调决定当data发生变化时，是否通知子树中依赖data的widget重新构建build。
  @override
  bool updateShouldNotify(covariant ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }

}