import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/home/base_view/base_view.dart';
import 'package:flutterstudy/home/custom_view/custom_route.dart';
import 'package:flutterstudy/route//route_names.dart';
import 'package:flutterstudy/route/route_title.dart';
import 'package:flutterstudy/entry/route_bean.dart';
import 'package:flutterstudy/home/dialog/alert_dialog_route.dart';
import 'package:flutterstudy/home/inherited_provider/provider_route.dart';
import 'package:flutterstudy/home/inherited_widget/inherited_route.dart';

import '../others/channel/basic_message_channel.dart';
import '../others/channel/event_channel_route.dart';
import '../others/channel/method_channel_route.dart';

class RouteData {
  ///home
  static  List<RouteBean> getElements() {
    return [
      RouteBean(name: RouteTitle.inheritWidget, route: RouteNames.homeInheritedRoute),
      RouteBean(name: RouteTitle.providerWidget, route: RouteNames.homeProviderRoute),
      RouteBean(name: RouteTitle.dialogWidget, route: RouteNames.homeAlertDialogRoute),
      RouteBean(name: RouteTitle.customWidget, route: RouteNames.homeCustomRoute),
      RouteBean(name: RouteTitle.baseView, route: RouteNames.homeBaseView)
    ];
  }
  ///Others
  static  List<RouteBean> getOthers() {
    return [
      RouteBean(name:RouteTitle.basicMessageChannel,route:RouteNames.othersBasicMessageChannel),
      RouteBean(name:RouteTitle.eventChannel,route:RouteNames.othersEventChannel),
      RouteBean(name:RouteTitle.methodChannel,route:RouteNames.othersMethodChannel),
    ];
  }

  static initRoutes(BuildContext context) {
    return {
      ///elements
      RouteNames.homeInheritedRoute:(context) => const InheritedRoute(),
      RouteNames.homeProviderRoute:(context) => const ProviderRoute(),
      RouteNames.homeAlertDialogRoute:(context)=> const AlertDialogRoute(),
      RouteNames.homeCustomRoute:(context)=> const CustomViewRoute(),
      RouteNames.homeBaseView:(context) => const BaseViewRoute(),
      ///Others
      RouteNames.othersBasicMessageChannel: (context) => const BasicMessageChannelRoute(),
      RouteNames.othersEventChannel: (context) => const EventChannelRoute(),
      RouteNames.othersMethodChannel: (context) => const MethodChannelRoute()
    };
  }
}
