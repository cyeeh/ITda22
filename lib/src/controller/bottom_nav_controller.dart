// ignore_for_file: constant_identifier_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_clone/src/components/message_popup.dart';
import 'package:insta_clone/src/pages/upload.dart';

enum PageName{Home, SEARCH, UPLOAD, ACTIVITY, MYPAGE}

class BottomNavController extends GetxController{

    static BottomNavController get to => Get.find();
    RxInt pageIndex = 0.obs;
    GlobalKey<NavigatorState> searchPageNavigationKey = 
        GlobalKey<NavigatorState> ();
    GlobalKey<NavigatorState> homePageNavigationKey = 
        GlobalKey<NavigatorState> ();
    List<int> bottomHistory = [0];

    void changeBottomNav(int value, {bool hasGesture = true}) {
        var page = PageName.values[value];

        switch (page){
            case PageName.UPLOAD:
                Get.to(() => const Upload()); 
                break;

            case PageName.Home:
            case PageName.SEARCH:
            case PageName.ACTIVITY:
            case PageName.MYPAGE:
                _changePage(value, hasGesture: hasGesture);
                break;
        }
    }

    void _changePage(int value, {bool hasGesture = true}){
        pageIndex(value);
        if (!hasGesture) return;

        if (bottomHistory.last != value){
            bottomHistory.add(value);
        }
        // if (bottomHistory.contains(value)){        // value값이 없을 때에만 추가
        //     bottomHistory.remove(value);
        // }
        // bottomHistory.add(value);
        // print(bottomHistory);
    }

    Future<bool> willPopAction() async {
        var page = PageName.values[bottomHistory.last];
        if (bottomHistory.length == 1){
            var value = await homePageNavigationKey.currentState!.maybePop();
            if (value) return false;
            
            showDialog(
                context: Get.context!, 
                builder: (context)=> MessagePopup(
                    title: '시스템',
                    message: '종료하시겠습니까?',
                    okCallback: (){ exit(0); },
                    cancelCallback: Get.back,
                )
            );
            return true;
        } else{
            if (page == PageName.SEARCH){
                var value = await searchPageNavigationKey.currentState!.maybePop();
                if (value) return false;
            }

            else if (page == PageName.Home){
                var value = await homePageNavigationKey.currentState!.maybePop();
                if (value) return false;
            }

            bottomHistory.removeLast();
            var index = bottomHistory.last;
            changeBottomNav(index, hasGesture: false);
            return false;
        }
    }
}