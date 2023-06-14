import 'package:flutter/material.dart';

class LineStep extends StatefulWidget {

  final isTop;
  final isBottom;
  LineStep({
    key,
    this.isTop: false,
    this.isBottom: false,
  }) : super(key: key);
  @override
  _LineStepState createState() => _LineStepState();
}

class _LineStepState extends State<LineStep> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: IntrinsicHeight(
        child: Row(
          children: <Widget>[
            leftWidget(),
            Expanded(
              child: rightWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget leftWidget() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 2,
            color: widget.isTop ? Colors.transparent : Colors.blue,
            height: 20,
          ),
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(8)),
          ),
          Expanded(
              child: Container(
                width: 2,
                color: widget.isBottom ? Colors.transparent : Colors.blue,
              )),
        ],
      ),
    );
  }
  Widget rightWidget() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Text(
            '申请已提交',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'content',
            style: TextStyle(color: Colors.orange, fontSize: 15),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}