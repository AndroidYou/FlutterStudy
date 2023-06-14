import 'package:flutter/material.dart';
import 'package:flutterstudy/common/common_button.dart';
import 'package:camera/camera.dart';
import 'package:flutterstudy/home/camera/CameraHomeScreen.dart';
import '../../common/common_scaffold.dart';
///拍照页面
class TakePhotoPage extends StatefulWidget {
  const TakePhotoPage({Key? key}) : super(key: key);

  @override
  State createState() => _TakePhotoPageState();
}

class _TakePhotoPageState extends State<TakePhotoPage> {
 late List<CameraDescription> cameras;
  @override
  void initState() {
   initCamera();
    super.initState();
  }
  Future<Null> initCamera() async{
    try {
      cameras = await availableCameras();
    } on CameraException catch (e) {
      //logError(e.code, e.description);
    }
  }
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        title: "图片选择",
        child: Center(
           child: CommonButton(text: "点击拍照",onPressed: (){
             print("object31:${cameras.length}");
               Navigator.of(context).push(MaterialPageRoute(builder: (context){
                 return CameraHomeScreen(cameras);
               }));
           },),
        ));
  }
}
