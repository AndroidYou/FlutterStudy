import 'package:flutter/cupertino.dart';
import 'package:flutterstudy/common/route_names.dart';
import 'package:flutterstudy/common/route_title.dart';
import 'package:flutterstudy/entry/route_bean.dart';
import 'package:flutterstudy/home/inherited_widget/inherited_route.dart';

import '../others/channel/basic_message_channel.dart';
import '../others/channel/event_channel_route.dart';
import '../others/channel/method_channel_route.dart';

class RouteData {
  ///home
  static  List<RouteBean> getElements() {
    return [
      RouteBean(name: RouteTitle.inheritWidget, route: RouteNames.homeInheritedRoute),
    ];
  }
  ///home
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
      ///Others
      RouteNames.othersBasicMessageChannel: (context) => const BasicMessageChannelRoute(),
      RouteNames.othersEventChannel: (context) => const EventChannelRoute(),
      RouteNames.othersMethodChannel: (context) => const MethodChannelRoute()
    };
  }
}
