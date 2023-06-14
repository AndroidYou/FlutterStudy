
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutterstudy/common/common_scaffold.dart';
import 'package:flutterstudy/home/photo/photo_album_manager.dart';

class SelectPhonePage extends StatefulWidget {
  const SelectPhonePage({Key? key}) : super(key: key);

  @override
  State createState() => _SelectPhonePageState();
}

class _SelectPhonePageState extends State<SelectPhonePage> {
  List<AlbumModelEntity> photos = [];
  @override
  void initState() {
    getPhoto();
    super.initState();
  }
  Future<void> getPhoto() async {
    photos = await PhotoAlbumManager.getDescAlbumImg(maxCount: null);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        title: "图片选择",
        child: Center(
          child:Stack(
            children: [
              Expanded(child:  GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: photos.length,
                itemBuilder: (BuildContext context, int index) {
                  AlbumModelEntity model = photos[index];
                  return GestureDetector(
                    child: Card(
                      child:ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: Image.file(
                          File(model.thumbPath ?? model.originalPath!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: () {

                    },
                  );
                },
              )),
             Center(child:  Offstage(
               offstage: photos.isNotEmpty,
               child:  Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const CircularProgressIndicator(),
                   const SizedBox(height: 20,),
                   Text("图片加载中,请稍等...",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),)
                 ],
               ),
             ))
            ],
          ),
        ));
  }
}
