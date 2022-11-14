import 'package:flutter/material.dart';
import 'package:insta_clone/src/components/avatar_widget.dart';
import 'package:insta_clone/src/components/image_data.dart';
import 'package:insta_clone/src/controller/bottom_nav_controller.dart';

class UserPage extends StatefulWidget {
    const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with TickerProviderStateMixin{
    late TabController tabController;

    @override
    void initState() {
        super.initState();
        tabController = TabController(
            length: 2,
            vsync: this
        );
    }

    Widget _statisticsOne(String title, int value){
        return Column(
            children: [
                Text(value.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                ),

                Text(title, 
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                    ),
                )
            ],
        );
    }

    Widget _information(){
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    Row(
                        children: [
                            AvatarWidget(
                                type: AvatarType.TYPE3, 
                                thumbPath: 'https://thumbs.dreamstime.com/b/cosmos-beauty-deep-space-elements-image-furnished-nasa-science-fiction-art-102581846.jpg',
                                size: 80,
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                        Expanded(child: _statisticsOne('Post', 15)),
                                        Expanded(child: _statisticsOne('Followers', 11)),
                                        Expanded(child: _statisticsOne('Following', 3)),
                                    ],
                                ),
                            )
                        ],
                    ),
                    const SizedBox(height: 10,),
                    const Text('안녕하세요.',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black
                        ),
                    )
                ],
            ),
        );
    }

    Widget _menu(){
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Row(
                children: [
                    Expanded(
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: const Color.fromARGB(255, 229, 227, 227),
                                border: Border.all(color: const Color(0xffdedede))
                            ),
                            child: const Text('팔로잉',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,
                            ),
                        ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: const Color.fromARGB(255, 229, 227, 227),
                                border: Border.all(color: const Color(0xffdedede))
                            ),
                            child: const Text('메시지',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,
                            ),
                        ),
                    ),

                ],
            ),
        );
    }

    Widget _tabMenu(){
        return TabBar(
            controller: tabController,
            indicatorColor: Colors.blue,
            indicatorWeight: 1,
            tabs: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ImageData(IconsPath.gridViewOn),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ImageData(IconsPath.myTagImageOff),
                )
            ]
        );
    }

    Widget _tabView(){
        return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 100,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1
            ),
            itemBuilder: (BuildContext context, int index){
                return Container(
                    color: Colors.grey,
                );
            }
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                elevation: 0,
                leading: GestureDetector(
                    // onTap: Get.back,
                    onTap: BottomNavController.to.willPopAction,
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ImageData(IconsPath.backBtnIcon),
                    ),
                ),
                title: const Text('honi',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black
                    ),
                ),

                actions: [
                    GestureDetector(
                        onTap: (){},
                        child: ImageData(IconsPath.uploadIcon, width: 50,),
                    ),
                    GestureDetector(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ImageData(IconsPath.menuIcon, width: 50,),
                        ),
                    )
                ],
            ),

            body: SingleChildScrollView(
                child: Column(
                    children: [
                        _information(),
                        _menu(),
                        // _discoverPeople(),
                        const SizedBox(height: 10,),
                        _tabMenu(),
                        _tabView()
                    ],
                ),
            ),
        );
    }
}
