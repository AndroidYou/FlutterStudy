import 'dart:collection';
import 'package:flutter/cupertino.dart';

class CarModel extends ChangeNotifier{
  final List<int> _items = [];
  //禁止改变集合信息
  UnmodifiableListView<int> get items => UnmodifiableListView(_items);

  int get totalCount =>_items.fold<int>(0, (value, element) => value+element);

  void addNum(int num){
    _items.add(num);
    notifyListeners();
  }

}