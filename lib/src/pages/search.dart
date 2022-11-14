import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:insta_clone/src/pages/search/search_focus.dart';
import 'package:quiver/iterables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
    const Search({Key? key}) : super(key: key);

    @override
    State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

    List<List<int>> groupBox = [[], [], []];
    List<int> groupIndex = [0, 0, 0];

    @override
    void initState(){
        super.initState();
        for (var i=0; i<100; i++){
            var gi = groupIndex.indexOf(min<int>(groupIndex)!);
            var size = 1;

            if (gi != 1){
                size = Random().nextInt(100) % 5 == 0? 2 : 1;
            }
            groupBox[gi].add(size);
            groupIndex[gi]+=size;
        }
    }

    Widget _appbar(){
        return Row(
            children: [
                Expanded(
                    child: GestureDetector(
                        onTap: (){
                            // Get.to(SearchFocus());
                            Navigator.push(context, 
                                MaterialPageRoute(builder: (context) => const SearchFocus())
                            );
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                            margin: const EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: const Color(0xffefefef)
                            ),
                            child: Row(children: const [
                                Icon(Icons.search),
                                Text('검색', style: TextStyle(fontSize: 15, color: Color(0xff838383)),)
                            ]),
                        ),
                    )
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(Icons.location_pin),
                ),
            ],
        );
    }

    Widget _body(){
        return SingleChildScrollView(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(groupBox.length, (index) => Expanded(
                        child: Column(
                            children: List.generate(groupBox[index].length, (jndex) => Container(
                                    height: Get.width * 0.33 * groupBox[index][jndex], 
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        color: Colors.primaries[
                                            Random().nextInt(Colors.primaries.length)
                                        ]
                                    ),
                                    child: CachedNetworkImage(imageUrl: 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F13%2F2016%2F11%2F15%2F2016-moana-movie-4k.jpg&q=60', 
                                        fit: BoxFit.cover
                                    ),
                                ),
                            ),
                        ),
                    ),
                ).toList(),
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: SafeArea(
                child: Column(
                    children: [
                        _appbar(),
                        Expanded(child: _body())
                    ],
                ),
            ),
        );
    }
}