import 'package:flutter/material.dart';
import 'package:flutterstudy/common/common_scaffold.dart';
import 'package:flutterstudy/home/custom_view/order_view/order_view.dart';

import 'LineStep.dart';

class OrderRoute extends StatelessWidget {
  OrderRoute({Key? key}) : super(key: key);
  List<OrderItem> list = [
    const OrderItem(title: Text("申请已提交", style: TextStyle(fontSize: 20),),
        subtitle: Text(
          "申请类型:安装", style: TextStyle(fontSize: 15, color: Colors.grey),),
        state: OrderState.finished),
    const OrderItem(title: Text("已派单", style: TextStyle(fontSize: 20)),
        subtitle: Text(
          "京东服务为您服务", style: TextStyle(fontSize: 15, color: Colors.grey),),
        state: OrderState.finished),
    const OrderItem(title: Text("待派送", style: TextStyle(fontSize: 20)),
        state: OrderState.doing),
    const OrderItem(title: Text("待安装完成", style: TextStyle(fontSize: 20)),
        state: OrderState.unfinished),
    const OrderItem(title: Text("待评价", style: TextStyle(fontSize: 20)),
        state: OrderState.unfinished),
  ];

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: ModalRoute
          .of(context)
          ?.settings
          .arguments
          .toString() ?? '',
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "尊敬的顾客，你的货物已到店，小哥将联系你前往门店提货，请按需携带取件码，感谢一路相伴！",
                style: TextStyle(
                    fontFamily: "FZLTHJW",
                    fontSize: 12,
                    height: 1.5,
                    color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: 1,
              width: double.infinity,
              color: Color(0X55C5D2DE),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: OrderView(
                  list: list,) /*ListView.builder(itemBuilder: (context,index){return OrderView(list: list,);},itemCount: list.length,)*/,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

}