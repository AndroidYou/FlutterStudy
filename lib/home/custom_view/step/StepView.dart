import 'dart:math';

import 'package:flutter/material.dart';

//步骤条
class StepView extends StatefulWidget {
  const StepView({
    Key? key,
    this.type = StepType.horizontal,
    this.height = 100,
    this.width = double.infinity,
    this.linesSpace = 8,
    this.linesWidth = 40,
    this.linesHeight = 1,
    this.mainColor = const Color(0xff62C4CA),
    this.secondColor = const Color(0xff9A9DA4),
    this.alignment = Alignment.center,
    required this.finishedIcon,
    required this.unfinishedIcon,
    required this.stepItems,
    required this.currentStep
  }) :  assert(0 <= currentStep && currentStep < stepItems.length);

  final StepType type; //水平还是垂直
  final double height;
  final double width;
  final double linesSpace; //线条左右距离
  final double linesWidth;
  final double linesHeight;
  final Color mainColor;
  final Color secondColor;
  final Alignment alignment;
  final Widget unfinishedIcon;
  final Widget finishedIcon;
  final List<StepItem> stepItems;
  final int currentStep;

  @override
  State createState() => _StepViewState();
}

class _StepViewState extends State<StepView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      alignment: widget.alignment,
      width: widget.width,
      child: _buildView(),
    );
  }

  Widget _buildView() {
    return ListView.builder(
        shrinkWrap: true, // //内容适配
        scrollDirection: widget.type == StepType.horizontal
            ? Axis.horizontal
            : Axis.vertical, //横向
        itemCount: widget.stepItems.length,
        itemBuilder: (context, index) {
          if (widget.type == StepType.horizontal){
            return _buildHorizontalItem(index);
          }else{
            return _buildVerticalItem(index);
          }

        });
  }
  Widget _buildHorizontalItem(int index) {
    var views = widget.stepItems.map((e) => _buildText(e));
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Row(
            children: [
              Opacity(
                opacity: index == 0 ? 0 : 1,
                child: Container(
                  width: widget.linesWidth,
                  height: widget.linesHeight,
                  margin: EdgeInsets.only(right: widget.linesSpace),
                  decoration: BoxDecoration(
                      color: widget.stepItems.elementAt(index).state == StepItemState.finished
                          ? widget.mainColor
                          : widget.secondColor),
                ),
              ),
              //_items.elementAt(index).finishedIcon,
              if (widget.stepItems.elementAt(index).state == StepItemState.finished) widget.finishedIcon else widget.unfinishedIcon ,
                Opacity(
                      opacity: widget.stepItems.length - 1 == index ? 0 : 1,
                      child: Container(
                        width: widget.linesWidth,
                        height: widget.linesHeight,
                        margin: EdgeInsets.only(left: widget.linesSpace),
                        decoration: BoxDecoration(
                            color: widget.stepItems.elementAt(index).state == StepItemState.finished && index< widget.currentStep
                                ? widget.mainColor
                                : widget.secondColor),
                      ),
                    )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: views.elementAt(index),
          ),
        ],
      ),
    );
  }


  Widget _buildVerticalItem(int index){
    var views = widget.stepItems.map((e) => _buildText(e));
    return Container(
      child: Row(

        children: [
          Column(
            children: [
              Opacity(
                opacity: index == 0 ? 0 : 1,
                child: Container(
                  width: widget.linesWidth,
                  height: widget.linesHeight,
                  margin: EdgeInsets.only(bottom: widget.linesSpace),
                  decoration: BoxDecoration(
                      color: widget.stepItems.elementAt(index).state == StepItemState.finished
                          ? widget.mainColor
                          : widget.secondColor),
                ),
              ),
              //_items.elementAt(index).finishedIcon,
              if (widget.stepItems.elementAt(index).state == StepItemState.finished) widget.finishedIcon else widget.unfinishedIcon ,
              Opacity(
                opacity: widget.stepItems.length - 1 == index ? 0 : 1,
                child: Container(
                  width: widget.linesWidth,
                  height: widget.linesHeight,
                  margin: EdgeInsets.only(top: widget.linesSpace),
                  decoration: BoxDecoration(
                      color: widget.stepItems.elementAt(index).state == StepItemState.finished && index< widget.currentStep
                          ? widget.mainColor
                          : widget.secondColor),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: views.elementAt(index),
          ),
        ],
      ),
    );
  }

  Widget _buildText(StepItem stepItem) {
    return Column(
      children: [
        stepItem.title,
        stepItem.subtitle ?? Container(),
        stepItem.content ?? Container()
      ],
    );
  }

}



enum StepType { vertical, horizontal }

enum StepItemState {
  finished, //完成
  doing, // 进行中
  unfinished //未完成
}

@immutable
class StepItem {
  const StepItem({
    required this.title,
    this.subtitle,
    this.content,
    this.state = StepItemState.finished,
  })  : assert(title != null),
        assert(state != null);

  final Widget title;
  final Widget? subtitle;
  final StepItemState state;
  final Widget? content;
}
