import 'package:flutter/material.dart';
import 'package:spotify_clone_app/components/library_card.dart';
import 'package:spotify_clone_app/components/scrollable_chip.dart';
import 'package:spotify_clone_app/mock_data/library_data.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
          child: Container(
        padding: const EdgeInsets.fromLTRB(10, 50, 0, 0),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "S",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "Your Library",
                      style: TextStyle(
                          fontSize: 23, fontWeight: FontWeight.w700),
                    ),
                    Expanded(child: Container()),
                    ...[
                      Icons.search,
                      Icons.add,
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
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ScrollableChip(
                        chips: [
                          "Playlists",
                          "Podcasts & Show",
                          "Albums",
                          "Artists"
                        ],
                      ),
                      SizedBox(
                        height: 55,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Transform.translate(
                    offset: const Offset(5, 2),
                    child: const Icon(
                      Icons.arrow_downward,
                      size: 18,
                    )),
                const Icon(
                  Icons.arrow_upward,
                  size: 18,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Recents",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Expanded(child: Container()),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.grid_view_outlined,
                    size: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(children: [
                ...libraryCardList.map((libraryCard) => LibraryCard(data: libraryCard)).toList()
              ],),
            )
          ],
        ),
      )),
    );
  }
}
