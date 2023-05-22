import 'package:flutter/material.dart';
import 'package:flutterstudy/common/common_scaffold.dart';
import 'package:flutterstudy/home/custom_view/step/StepView.dart';

class StepViewRoute extends StatefulWidget {
  const StepViewRoute({Key? key}) : super(key: key);

  @override
  State createState() => _StepViewRouteState();
}

class _StepViewRouteState extends State<StepViewRoute> {

  var items = [
    StepItem(title: Text("幼儿园"),subtitle:Text("不想长大"),state: StepItemState.finished),
    StepItem(title: Text("小学"),state: StepItemState.finished),
    StepItem(title: Text("中学"),state: StepItemState.finished),
    StepItem(title: Text("高中"),state: StepItemState.doing),
    StepItem(title: Text("大学"),state: StepItemState.unfinished),
  ];


  @override
  Widget build(BuildContext context) {
    return CommonScaffold(title: "Step步骤条", child: Column(
      children: [
        Expanded(child: StepView(currentStep:2,finishedIcon: SizedBox(height: 30,width: 30,child: Image.asset("images/icon_chose.png"),), unfinishedIcon: SizedBox(width: 30,height: 30,child: Image.asset("images/icon_unchose.png"),), stepItems: items,),flex: 1,),
        Expanded(child: StepView(width:double.infinity,height:double.infinity,currentStep:2,type: StepType.vertical,linesHeight: 40,linesWidth: 2,finishedIcon: SizedBox(height: 30,width: 30,child: Image.asset("images/icon_chose.png"),), unfinishedIcon: SizedBox(width: 30,height: 30,child: Image.asset("images/icon_unchose.png"),), stepItems:items,),flex: 1,),
      ],
    ));
  }
}
