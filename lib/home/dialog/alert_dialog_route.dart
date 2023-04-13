import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/common/common_scaffold.dart';

class AlertDialogRoute extends StatefulWidget {
  const AlertDialogRoute({super.key});

  @override
  State<StatefulWidget> createState() => _AlertDialogRoute();
}

class _AlertDialogRoute extends State<AlertDialogRoute> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: ModalRoute.of(context)?.settings.arguments.toString() ?? '',
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  var result = _showDeleteConfirmDialog();
                },
                child: const Text("对话框1")),
            ElevatedButton(
                onPressed: () {
                  changeLanguage();
                },
                child: const Text("对话框2")),
            ElevatedButton(
                onPressed: () {
                  var result = _showBottomSheetDialog();
                  print("选择:$result");
                },
                child: const Text("底部弹框")),
            ElevatedButton(
                onPressed: () {
                  showLoadingDialog();
                },
                child: const Text("加载Loading框")),
            ElevatedButton(
                onPressed: () {
                  showCustomLoadingDialog();
                },
                child: const Text("自定义宽度的加载Loading框")),
            ElevatedButton(
                onPressed: () {
                  var date = _showAndroidDatePicker();
                  print("你选择的日期是${date}");
                },
                child: const Text("Android样式的日期选择器")),
            ElevatedButton(
                onPressed: () {
                 _showiOSDatePicker();
                },
                child: const Text("iOS样式的日期选择器"))
          ],
        ),
      ),
    );
  }

  ///对话框1
  Future<bool?> _showDeleteConfirmDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("提示"),
            content: const Text("确定要删除当前文字吗?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("取消")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text("确定")),
            ],
          );
        });
  }

  ///对话框2
  Future<void> changeLanguage() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("选择语言"),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text('简体中文'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 2);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text('繁体中文'),
                ),
              )
            ],
          );
        });
    print("你选择了:$result");
  }

  ///底部弹框
  Future<int?> _showBottomSheetDialog() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: const Text("今天是2023年4月12日，星期三，晴"),
                  onTap: () {
                    Navigator.of(context).pop(index);
                  },
                );
              });
        });
  }

  ///loading加载框
  showLoadingDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("正在加载中..."),
                ),
              ],
            ),
          );
        });
  }

  ///自定义宽度的loading加载框
  showCustomLoadingDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: SizedBox(
              width: 280,
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("正在加载中..."),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  ///安卓样式的日期选择器
  Future<DateTime?> _showAndroidDatePicker() {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add(const Duration(days: 100)),
    );
  }

  ///iOS样式的日期选择器
  Future<DateTime?> _showiOSDatePicker() {
    var date = DateTime.now();
    return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.dateAndTime,
              minimumDate: date,
              maximumDate: date.add(const Duration(days: 100)),
              onDateTimeChanged: (DateTime value) {
                print("你选择的日期:${value.day}");
              },
            ),
          );
        });
  }
}
