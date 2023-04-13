import 'dart:collection';
import 'package:flutter/cupertino.dart';

class CarModel extends ChangeNotifier{
  final List<int> _items = [];
  //禁止改变集合信息
  List<int> get items =>_items;

  int get totalCount =>_items.fold<int>(0, (value, element){
    value = value+element;
    print("carModel:$value");
    return value;
  });

  void addNum(int num){
    _items.add(num);
    notifyListeners();
  }

}