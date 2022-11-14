import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_clone/src/components/image_data.dart';
import 'package:insta_clone/src/pages/home/home_tip_reply.dart';
import 'package:like_button/like_button.dart';

class HomeTip extends StatelessWidget {
  const HomeTip({Key? key}) : super(key: key);

  Future<bool> onLikeButtonTapped(bool isLiked) async{
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            // ignore: sort_child_properties_last
            child: const Text(
              '팁 영상',
              style: TextStyle(color: Colors.black),
            ),
            color: Colors.white,
          ),

          Positioned(
            right: 15,
            bottom: 25,
            child: Column(
              children: [  
                LikeButton(
                  onTap: onLikeButtonTapped,
                  // circleColor: CircleColor(start: Colors.yellow, end: Colors.red),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  child: ImageData(
                    IconsPath.replyIcon,
                    width: 75,
                  ),
                  onTap: (){
                    Get.to(const HomeTipReply());
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
                ImageData(
                  IconsPath.directMessage,
                  width: 70,
                ),
              ],
            )
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Container(
              width: MediaQuery.of(context).size.width * 2 / 3,
              alignment: Alignment.bottomLeft,
              child: const ExpandableText(
                '팁~~~팁~~~팁~~~팁~~~팁~~~팁~~~팁~~~팁~~~팁~~~팁~~~\n팁~~~팁~~~팁~~~팁~~~팁~~~팁~~~팁~~~팁~~~팁~~~팁~~~\n팁~~~팁~~~팁~~~팁~~~팁~~~팁~~~팁~~~팁~~~팁~~~팁~~~\n팁~~~팁~~~팁~~~팁~~~팁~~~팁~~~팁~~~팁~~~팁~~~팁~~~',
                style: TextStyle(color: Colors.black),
                prefixText: 'honi ',
                prefixStyle: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
                expandText: '더보기',
                collapseText: '접기',
                maxLines: 3,
                expandOnTextTap: true,
                collapseOnTextTap: true,
                linkColor: Colors.grey,
              )
            ),
          )
        ],
      ),
    );
  }
}
