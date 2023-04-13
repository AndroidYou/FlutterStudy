import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonScaffold extends StatelessWidget{
  const CommonScaffold({super.key,required this.title,required this.child});
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text(title),),
      body: child,
    );
  }

}