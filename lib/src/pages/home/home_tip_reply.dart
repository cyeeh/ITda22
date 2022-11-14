import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_clone/src/components/avatar_widget.dart';
import 'package:insta_clone/src/components/image_data.dart';

class HomeTipReply extends StatelessWidget {
    const HomeTipReply({Key? key}) : super(key: key);

    Widget _reply(BuildContext context){
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
                children: [
                    AvatarWidget(
                        type: AvatarType.TYPE2, 
                        thumbPath: 'https://thumbs.dreamstime.com/b/cosmos-beauty-deep-space-elements-image-furnished-nasa-science-fiction-art-102581846.jpg',
                        size: 40,
                    ),
                    const SizedBox(width: 15,),

                    const Text.rich(
                        TextSpan(
                            text: 'honi2',
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                            children: [
                                TextSpan(
                                    text: '짱짱짱\n짱짱짱',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal
                                    ),
                                ),
                                TextSpan(
                                    text: '\n5일\t\t\t좋아요 14개\t\t\t답글 달기\t\t\t보내기\t\t\t번역 보기',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        color: Colors.black54
                                    ),
                                ),
                            ]
                        )
                    ),
                ],
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                centerTitle: true,
                title: const Text('댓글',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                ),
                elevation: 0,
                leading: GestureDetector(
                    onTap: Get.back,
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ImageData(IconsPath.backBtnIcon),
                    ),
                ),
            ),
        
            body: SingleChildScrollView(
                child: Column(
                    children: List.generate(10, (index) => _reply(context)).toList(),
                ),
            ),
        );
        
    }
}