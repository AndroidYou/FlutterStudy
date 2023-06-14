import 'dart:core';


import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key,
    this.hintText,
    this.borderColor = Colors.transparent,
    this.backGroundColor = Colors.grey,
    this.borderWidth = 0,
    this.borderRadius = 30,
    this.width = double.infinity,
    this.height = 50,
    this.paddingLeft = 15,
    this.paddingRight =15,
    this.freFixImage,
    this.suffixImage,
    this.hintStyle,
    this.controller,
    this.autofocus = true,
    this.textInputAction = TextInputAction.done,
    this.style,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorColor,
    this.showCursor = true,
    this.cursorRadius
  }) : super(key: key);

  final Color backGroundColor; ///背景色
  final Color borderColor; ///边框色
  final double borderWidth; ///边框宽度
  final double borderRadius; ///边框圆角度数
  final double width;  ///宽度
  final double height; ///高度
  final double paddingLeft; ///左内边距
  final double paddingRight; ///右内边距
  final Widget? freFixImage; /// 添加前缀图片
  final Widget? suffixImage; ///添加后缀图片
  final String? hintText;///提示文本
  final TextStyle? hintStyle;///提示文本样式
  final TextStyle? style;///内容文本样式
  final bool autofocus; ///是否自动获取焦点
  final TextInputAction textInputAction; ///修改键盘右下角按键，done 完成操作，search 搜索，send 发送，next 下一步
  final TextEditingController? controller; /// 控制器
  final Color? cursorColor;///光标颜色
  final double? cursorHeight; ///光标高度
  final double cursorWidth; ///光标宽度
  final Radius? cursorRadius; ///光标圆角
  final bool showCursor; ///是否显示光标

  @override
  State createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(color: widget.borderColor, width: widget.borderWidth),
              color: widget.backGroundColor),
          child: Padding(
            padding: EdgeInsets.only(left: widget.paddingLeft,right: widget.paddingRight),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.freFixImage??Container(),
                Expanded(
                    flex: 1,
                    child: TextField(
                      style: widget.style,
                      autofocus: widget.autofocus,
                      controller: widget.controller,
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        hintStyle:widget.hintStyle,
                        border: InputBorder.none,
                      ),
                      textInputAction: widget.textInputAction,
                      cursorColor: widget.cursorColor,
                      cursorHeight: widget.cursorHeight,
                      cursorRadius: widget.cursorRadius,
                      cursorWidth: widget.cursorWidth,
                      showCursor: widget.showCursor,

                    ),
                ),
                widget.suffixImage??Container()
              ],
            ),
          ),
        )
      ],
    );
  }
}
