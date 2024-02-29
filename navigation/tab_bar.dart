import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone_app/Controller/tab_bar_controller.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<TabBarController>(
        init: TabBarController(),
        builder: (controller) {
          return Scaffold(
            extendBody: true,
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: const Color(0x00ffffff),
                currentIndex: controller.selectedTab.value,
                onTap: (index) {
                  controller.selectedTab.value = index;
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: "Search"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.library_music_sharp),
                      label: "Your Library"),
                ]),
            body: controller.widgetList[controller.selectedTab.value],
          );
        });
  }
}
