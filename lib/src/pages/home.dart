import 'package:flutter/material.dart';
import 'package:insta_clone/src/components/image_data.dart';
import 'package:insta_clone/src/components/post_widget.dart';

class Home extends StatelessWidget {
    const Home({Key? key}) : super(key: key);

    Widget _postList(){
        return Column(
            children: List.generate(50, (index) => const PostWidget()).toList(),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                elevation: 1,
                title: const Text('Trip',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontFamily: 'Georgia',
                        color: Colors.blueGrey
                    ),
                ),
                actions: [
                    GestureDetector(
                        onTap: (){
                            print('message');
                        },
                        child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ImageData(IconsPath.directMessage, width: 50,),
                        ),
                    )
                ],
            ),

            body: ListView(
                children: [
                    _postList()
                ],
            ),
        );
    }
}