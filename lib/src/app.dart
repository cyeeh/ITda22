// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_clone/src/components/avatar_widget.dart';
import 'package:insta_clone/src/components/image_data.dart';
import 'package:insta_clone/src/controller/bottom_nav_controller.dart';
import 'package:insta_clone/src/pages/active_history.dart';
import 'package:insta_clone/src/pages/home.dart';
import 'package:insta_clone/src/pages/mypage.dart';
import 'package:insta_clone/src/pages/search.dart';

class App extends GetView<BottomNavController> {
    const App({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return WillPopScope(
        // ignore: sort_child_properties_last
            child: Obx(() => Scaffold(
                body: IndexedStack(
                    index: controller.pageIndex.value,
                    children: [
                        // const Home(),
                        Navigator(
                            key: controller.homePageNavigationKey,
                            onGenerateRoute: (routeSetting){
                                return MaterialPageRoute(builder: (context) => const Home());
                            },
                        ),

                        // navigator 안쪽에서는 getx 방식 말고 기존 라우트 방식 사용해야 함
                        Navigator(
                            key: controller.searchPageNavigationKey,
                            onGenerateRoute: (routeSetting){
                                return MaterialPageRoute(builder: (context) => const Search());
                            },
                        ),
                        
                        Container(),

                        const ActiveHistory(),
                        
                        const MyPage()
                    ],
                ),

                bottomNavigationBar: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    currentIndex: controller.pageIndex.value,
                    elevation: 0,
                    onTap: controller.changeBottomNav,
                    items: [
                        BottomNavigationBarItem(
                            icon: ImageData(IconsPath.homeOff),
                            activeIcon: ImageData(IconsPath.homeOn),
                            label: 'home'),
                        BottomNavigationBarItem(
                            icon: ImageData(IconsPath.searchOff),
                            activeIcon: ImageData(IconsPath.searchOn),
                            label: 'search'),
                        BottomNavigationBarItem(
                            icon: ImageData(IconsPath.uploadIcon), 
                            label: 'upload'),
                        BottomNavigationBarItem(
                            icon: ImageData(IconsPath.activeOff),
                            activeIcon: ImageData(IconsPath.activeOn),
                            label: 'activity'),
                        BottomNavigationBarItem(
                            icon: AvatarWidget(
                                type: AvatarType.TYPE2, 
                                thumbPath: 'https://thumbs.dreamstime.com/b/cosmos-beauty-deep-space-elements-image-furnished-nasa-science-fiction-art-102581846.jpg',
                                size: 30,
                            ),
                            label: 'mypage'),
                    ],
                ),
            )),
        onWillPop: controller.willPopAction,
        );
    }
}
