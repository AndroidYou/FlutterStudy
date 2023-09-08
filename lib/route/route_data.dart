import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/framework/listview/fw_listview_route.dart';
import 'package:flutterstudy/home/base_view/base_view.dart';
import 'package:flutterstudy/home/camera/CameraHomeScreen.dart';
import 'package:flutterstudy/home/camera/take_photo_page.dart';
import 'package:flutterstudy/home/custom_view/board_route/custom_chess_board.dart';
import 'package:flutterstudy/home/custom_view/button/button_route.dart';
import 'package:flutterstudy/home/custom_view/custom_route.dart';
import 'package:flutterstudy/home/custom_view/grid_view/grid_route.dart';
import 'package:flutterstudy/home/custom_view/navigation/navigation_route.dart';
import 'package:flutterstudy/home/custom_view/order_view/order_route.dart';
import 'package:flutterstudy/home/custom_view/progress/gradient_circular_progress_route.dart';
import 'package:flutterstudy/home/custom_view/search_view/search_route.dart';
import 'package:flutterstudy/home/custom_view/step/step_route.dart';
import 'package:flutterstudy/home/navigator/first_navigator_route.dart';
import 'package:flutterstudy/home/navigator/second_navigator_route.dart';
import 'package:flutterstudy/home/photo/select_photo_page.dart';
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
  static List<RouteBean> getElements() {
    return [
      RouteBean(name: RouteTitle.baseView, route: RouteNames.homeBaseView),
      RouteBean(
          name: RouteTitle.inheritWidget, route: RouteNames.homeInheritedRoute),
      RouteBean(
          name: RouteTitle.providerWidget, route: RouteNames.homeProviderRoute),
      RouteBean(
          name: RouteTitle.dialogWidget,
          route: RouteNames.homeAlertDialogRoute),
      RouteBean(
          name: RouteTitle.customWidget, route: RouteNames.homeCustomRoute),
      RouteBean(name: RouteTitle.photoView, route: RouteNames.homePhotoView),
      RouteBean(name: RouteTitle.cameraView, route: RouteNames.homeCameraView),
      RouteBean(name: RouteTitle.navigatorView, route: RouteNames.homeNavigator)
    ];
  }

  ///customView
  static List<RouteBean> getCustoms() {
    return [
      RouteBean(name: RouteTitle.customButton, route: RouteNames.customButton),
      RouteBean(name: RouteTitle.customBoard, route: RouteNames.customBoard),
      RouteBean(
          name: RouteTitle.customProgressView,
          route: RouteNames.customProgressView),
      RouteBean(
          name: RouteTitle.customStepView, route: RouteNames.customStepView),
      RouteBean(
          name: RouteTitle.customNavigation,
          route: RouteNames.customNavigation),
      RouteBean(
          name: RouteTitle.customOrderView, route: RouteNames.customOrderView),
      RouteBean(
          name: RouteTitle.customGridView, route: RouteNames.customGridView),
      RouteBean(
          name: RouteTitle.customSearchView,
          route: RouteNames.customSearchView),
    ];
  }

  ///Others
  static List<RouteBean> getOthers() {
    return [
      RouteBean(
          name: RouteTitle.basicMessageChannel,
          route: RouteNames.othersBasicMessageChannel),
      RouteBean(
          name: RouteTitle.eventChannel, route: RouteNames.othersEventChannel),
      RouteBean(
          name: RouteTitle.methodChannel,
          route: RouteNames.othersMethodChannel),
    ];
  }

  /// ----------------------框架----------------------*
  static List<RouteBean> getFrameWork(){
    return [
      RouteBean(
          name: RouteTitle.frameWorkListView,
          route: RouteNames.frameWorkListView),
    ];
  }


  static initRoutes(BuildContext context) {
    return {
      ///Home
      RouteNames.homeInheritedRoute: (context) => const InheritedRoute(),
      RouteNames.homeProviderRoute: (context) => const ProviderRoute(),
      RouteNames.homeAlertDialogRoute: (context) => const AlertDialogRoute(),
      RouteNames.homeCustomRoute: (context) => const CustomViewRoute(),
      RouteNames.homeBaseView: (context) => const BaseViewRoute(),
      RouteNames.homePhotoView: (context) => const SelectPhonePage(),
      RouteNames.homeCameraView: (context) =>const TakePhotoPage(),
      RouteNames.homeNavigator:(context) =>const FirstNavigatorRoute(),
      "/second_navigator_route":(context) => const SecondNavigatorRoute(),

      ///CustomView
      RouteNames.customButton: (context) => const ButtonRoute(),
      RouteNames.customBoard: (context) => const CustomChessBoard(),
      RouteNames.customProgressView: (context) =>
          const GradientCircularProgressRoute(),
      RouteNames.customStepView: (context) => const StepViewRoute(),
      RouteNames.customNavigation: (context) => const NavigationRoute(),
      RouteNames.customOrderView: (context) => OrderRoute(),
      RouteNames.customGridView: (context) => GridRoute(),
      RouteNames.customSearchView: (context) => const SearchRoute(),

      ///Others
      RouteNames.othersBasicMessageChannel: (context) =>
          const BasicMessageChannelRoute(),
      RouteNames.othersEventChannel: (context) => const EventChannelRoute(),
      RouteNames.othersMethodChannel: (context) => const MethodChannelRoute(),

      /// ----------------------框架----------------------*
      RouteNames.frameWorkListView: (context) => const ListViewRoute()
    };
  }
}
