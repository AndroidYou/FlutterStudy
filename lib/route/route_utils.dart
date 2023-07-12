import 'package:flutter/material.dart';
class RouteUtils{

 static final _navigatorKey = GlobalKey<NavigatorState>();

 static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static Future<dynamic> pushName(String routeName,{Object? arguments}) async{
    return _navigatorKey.currentState!.pushNamed(routeName,arguments: arguments);
  }

}