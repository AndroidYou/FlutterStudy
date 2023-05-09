import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/common/common_scaffold.dart';

class BaseViewRoute extends StatefulWidget {
  const BaseViewRoute({Key? key}) : super(key: key);

  @override
  State<BaseViewRoute> createState() => _BaseViewRouteState();
}

class _BaseViewRouteState extends State<BaseViewRoute> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        title: ModalRoute.of(context)?.settings.arguments.toString() ?? "",
        child: Column(
          children:  [
            const Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: '1.Text.rich->我是富文本',
                  style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.red
                  )
                ),
                TextSpan(
                    text: '每段文字都不一样，你要好好看',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100,color: Colors.blue
                    )
                ),
                TextSpan(
                    text: '日常会使用就行',
                    style: TextStyle(fontSize: 26,fontWeight: FontWeight.w100,color: Colors.yellow
                    )
                ),
              ]
            )),
            RichText(text:const TextSpan(
                children: [
                  TextSpan(
                      text: '1.RichText->我是富文本2',
                      style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.red
                      )
                  ),
                  TextSpan(
                      text: '每段文字都不一样，你要好好看',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100,color: Colors.blue
                      )
                  ),
                  TextSpan(
                      text: '日常会使用就行',
                      style: TextStyle(fontSize: 26,fontWeight: FontWeight.w100,color: Colors.yellow
                      )
                  ),

                ]
            )),
            const SizedBox(height: 20,),
            const Text("FadeImage",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.deepOrange),),
            FadeInImage(placeholder: const AssetImage("assetName"), image: Image.network("src").image,
              fadeInDuration: const Duration(milliseconds: 500),
              fadeInCurve: Curves.easeInOutBack,
              fadeOutDuration: const Duration(milliseconds: 500),
            fadeOutCurve: Curves.easeInCirc,),

          ],
        ));
  }
}
