import 'dart:ffi';

import 'package:flutter/material.dart';

class NavigationView extends StatelessWidget {
  const NavigationView(
      {Key? key,
      required this.list,
      required this.currentIndex,
      this.lineWidth = 80})
      : super(key: key);

  final int currentIndex;
  final double lineWidth;
  final List<int> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ListView.builder(
          shrinkWrap: true, //内容适配
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _navigationItem(index);
          }),
    );
  }

  Widget _navigationItem(int index) {
    return Column(
      children: [
        Row(
          children: [
            //画左边的线
            Opacity(
              opacity: index == 0 ? 0 : 1,
              child: LayoutBuilder(builder: (context,c){
                if(index<=currentIndex){
                  return Container(
                    width: lineWidth / 2,
                    height: 2,
                    margin: EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                        color: Colors.blue, borderRadius: BorderRadius.circular(3)),
                  );
                }else{
                 return Container(width: lineWidth/2,child: dashWidget(), margin: EdgeInsets.only(right: 4),);

                  return Container();
                }

              },),
            ),
            SizedBox(
              child: Image.asset("images/icon_chose.png"),
              width: 15,
              height: 15,
            ),
            //画左边的线
            Opacity(
                opacity: index == list.length - 1 ? 0 : 1,
                child: LayoutBuilder(builder: (context,c){
                  if(index <=currentIndex){
                    return Container(
                      margin: EdgeInsets.only(left: 4),
                      width: lineWidth / 2,
                      height: 2,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(3)),
                    );
                  }else{
                    return Container(width: lineWidth/2,child: dashWidget(), margin: EdgeInsets.only(left: 4,right: 2),);
                  }
                },)),
          ],
        ),
        Text("$index")
      ],
    );
  }

  //虚线
  Widget dashWidget() {

      final boxWidth = lineWidth/2;
      const dashWidth = 3.0;
      const dashHeight = 2.0;
      final dashCount = (boxWidth / (2 * dashWidth)).floor();
      return Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
        children: List.generate(
            dashCount,
                (index) => SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue),
              ),
            )),
      );

  }
}
