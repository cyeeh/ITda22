import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_clone/src/components/avatar_widget.dart';
import 'package:insta_clone/src/components/image_data.dart';
import 'package:insta_clone/src/controller/bottom_nav_controller.dart';
import 'package:insta_clone/src/pages/home/home_reply.dart';
import 'package:insta_clone/src/pages/home/home_tip.dart';
import 'package:insta_clone/src/pages/home/home_user_page.dart';

class PostWidget extends GetView<BottomNavController> {

    const PostWidget({Key? key}) : super(key: key);

    // 공유, 링크, 신고
    Widget _headerBottom1(String b1Name, IconData b1Icon, Color b1Color){
        return GestureDetector(
            onTap: (){print(b1Name);},
            child: Container(
                width: 100,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(31, 137, 132, 132),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Icon(b1Icon,color: b1Color,),
                        const SizedBox(height: 10,),
                        Text(b1Name, style: TextStyle(color: b1Color),)
                    ],
                    
                ),
            ),
        );
    }

    // 즐겨찾기에 추가, 숨기기, 팔로우 취소
    BorderRadiusGeometry _border(int num){
        if (num == 1){
            return const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10));
        }
        else if (num == 3){
            return const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10));
        }
        else {
            return BorderRadius.zero;
        }
    }

    Widget _headerBottom2(BuildContext context, String b2Name, int num){
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: GestureDetector(
                onTap: (){print(b2Name);},
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: _border(num),
                        color: const Color.fromARGB(31, 137, 132, 132),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text(b2Name)
                        ],
                        
                    ),
                ),
            ),
        );
    }

    // post_헤더
    Widget _header(BuildContext context){
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    // 프로필 이동
                    GestureDetector(
                        onTap: (){
                            Navigator.push(context, 
                                MaterialPageRoute(builder: (context) => const UserPage())
                            );
                        },
                        child: AvatarWidget(
                            type: AvatarType.TYPE3,
                            nickname: 'honi',
                            size: 40,
                            thumbPath: 'https://thumbs.dreamstime.com/b/cosmos-beauty-deep-space-elements-image-furnished-nasa-science-fiction-art-102581846.jpg', 
                        ),
                    ),

                    // 더보기
                    GestureDetector(
                        onTap: (){
                            showModalBottomSheet(
                                context: context, 
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)
                                    )
                                ),

                                builder: (_) => SizedBox(
                                    height: 350,
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                            Center(
                                                child: Container(
                                                    margin: const EdgeInsets.only(top: 7),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10),
                                                        color: Colors.black54
                                                    ),
                                                    width: 40,
                                                    height: 4,
                                                ),
                                            ),

                                            Expanded(
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                        Padding(
                                                            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                                                            child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                    _headerBottom1('공유', Icons.share, Colors.black),
                                                                    _headerBottom1('링크', Icons.link, Colors.black),
                                                                    _headerBottom1('신고', Icons.warning, Colors.redAccent),
                                                                ]
                                                            ),
                                                        ),

                                                        Column(
                                                            children: [
                                                                _headerBottom2(context, '즐겨찾기에 추가',1),
                                                                _headerBottom2(context, '숨기기',2),
                                                                _headerBottom2(context, '팔로우 취소',3),
                                                            ],
                                                        )
                                                    ]
                                                ),
                                            )
                                        ],
                                    ),
                                )
                            );                       
                        },

                        child: Container(
                            padding: const EdgeInsets.all(5.0),
                            margin: const EdgeInsets.all(5),
                            // color: Colors.red,
                            child: ImageData(IconsPath.postMoreIcon, width: 30,),
                        ),
                    )
                ],
            ),
        );
    }

    // post_이미지
    Widget _image(BuildContext context){
        return Stack(
            children: [
                // 사진
                CachedNetworkImage(
                    imageUrl: 'https://blog.kakaocdn.net/dn/lo1sX/btq58ZbLoNi/VynSzIgjMTfCkwkAxWgqN1/img.jpg',
                    
                ),

                // 팁보기
                Positioned(
                    right: -5,
                    top: 3,
                    child: ElevatedButton(
                        onPressed: (){
                            Navigator.push(context, 
                                MaterialPageRoute(builder: (context) => const HomeTip())
                            );
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 0,
                            shape: const CircleBorder(),       
                        ),
                        child: const Text('팁', 
                            style: TextStyle(
                                color: Colors.black
                            ),
                        )
                    ),
                )
            ],
        );
    }

    // post_좋아요, 조회수, 내용
    Widget _infoDescription(BuildContext context){
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    const Text('좋아요 150개    조회수 500회', 
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Color.fromRGBO(244, 143, 177, 1)
                        ),
                    ),
                    const SizedBox(height: 6,),

                    ExpandableText(
                        '여행내용~여행내용~\n여행내용~여행내용~\n여행내용~여행내용~\n여행내용~여행내용~', 
                        prefixText: 'honi',
                        onPrefixTap: (){
                            Navigator.push(context, 
                                MaterialPageRoute(builder: (context)=>const UserPage())
                            );
                        },
                        prefixStyle: const TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                        expandText: '더보기',
                        collapseText: '접기',
                        maxLines: 3,
                        expandOnTextTap: true,
                        collapseOnTextTap: true,
                        linkColor: Colors.grey,
                    )
                ],
            ),
        );
    }

    // post_댓글
    Widget _replyTextBtn(BuildContext context){
        return GestureDetector(
            onTap: (){
                Get.to(const HomeReply());
                // Navigator.push(context, 
                //     MaterialPageRoute(builder: (context) => const HomeReply())
                // );
            },
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('댓글 199개 모두 보기',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13
                    ),
                ),
            ),
        );
    }

    // post_날짜
    Widget _dateAgo(){
        return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text('1일전',
                style: TextStyle(color: Colors.grey, fontSize: 11),
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    _header(context),
                    const SizedBox(height: 15,),
                    _image(context),
                    const SizedBox(height: 10,),
                    // _infoCount(),
                    // const SizedBox(height: 5,),
                    _infoDescription(context),
                    const SizedBox(height: 5,),
                    _replyTextBtn(context),
                    const SizedBox(height: 5,),
                    _dateAgo()
                ],
            ),
        );
    }
}