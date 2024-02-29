// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:spotify_clone_app/mock_data/album_data.dart';
import 'package:spotify_clone_app/utils/utils.dart';

import '../components/scrollable_chip.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 50, 0, 0),
            // constraints: BoxConstraints.expand(),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getGreetingMessage(DateTime.now()),
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(child: Container()),
                    ...[
                      Icons.notifications,
                      Icons.history_toggle_off_outlined,
                      Icons.settings_outlined,
                    ].map((icon) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          icon,
                          size: 30,
                        ),
                      );
                    }).toList(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const ScrollableChip(
                  chips: ["Music", "Podcasts & shows"],
                ),
                const SizedBox(
                  height: 40,
                ),
                ...homeScreendata.map((cardData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        cardData.title,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...cardData.widgets.map((widget) {
                              return widget;
                            }).toList(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
        ));
  }
}
