import 'package:flutter/cupertino.dart';
import 'package:flutterstudy/home/inherited_widget/change_notifier_provider.dart';

class CustomWidget<T> extends StatelessWidget{
  const CustomWidget({super.key,required this.builder});
  final Widget Function(BuildContext context,T? value) builder;
  @override
  Widget build(BuildContext context) {
   return builder(context,ChangeNotifierProvider.of<T>(context, false));
  }

}