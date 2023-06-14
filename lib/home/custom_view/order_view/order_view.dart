import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  const OrderView(
      {Key? key,
      required this.list,
      this.linesSpace = 5,
      this.linesWidth = 2,
      this.linesColor = const Color(0xFF62C4CA),
      this.textSpace = 10})
      : super(key: key);
  final List<OrderItem> list;
  final double linesSpace;//线条间隔
  final double linesWidth; //线条宽度
  final Color linesColor; //线条颜色
  final double textSpace; //文字之间的间隔




  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (c, index) {
        return _lineItems(index);
      },
      itemCount: list.length,
    );
  }

  Widget _lineItems(index) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leftWidget(index),
          Expanded(
            child: rightWidget(index),
          ),
        ],
      ),
    );
  }

  Widget leftWidget(int index) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: linesWidth,
            color: index == 0 ? Colors.transparent : linesColor,
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(
                top: index == 0 ? 0 : linesSpace,
                bottom: index == list.length - 1 ? 0 : linesSpace),
            width: 16,
            height: 16,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(8)),
          ),
          Expanded(
            child: Container(
              width: linesWidth,
              color: index == list.length - 1 ? Colors.transparent : linesColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget rightWidget(int index) {
    return Container(
      margin: EdgeInsets.only(
          top: index == 0 ? 0 : linesSpace,
          bottom: index == list.length - 1 ? 0 : linesSpace,
          left: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          list[index].title,
          SizedBox(
            height: list[index].subtitle == null ? 0 : textSpace,
          ),
          list[index].subtitle ?? Container(),
          SizedBox(
            height: list[index].content == null ? 0 : textSpace,
          ),
          list[index].content ?? Container(),
        ],
      ),
    );
  }
}

enum OrderState {
  finished,
  doing,
  unfinished //未完成
}

@immutable
class OrderItem {
  const OrderItem(
      {required this.title, required this.state, this.subtitle, this.content});

  final Widget title;
  final Widget? subtitle;
  final OrderState state;
  final Widget? content;
}
