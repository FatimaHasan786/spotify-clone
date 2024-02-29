import 'package:flutter/material.dart';
import 'package:spotify_clone_app/components/search_card.dart';
import 'package:spotify_clone_app/mock_data/search_data.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
              // constraints: BoxConstraints.expand(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SearchHeader(),
                  const SizedBox(
                    height: 30,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          size: 35,
                        ),
                        prefixIconColor: Colors.black,
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'What do you want to listen to?',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 76, 76, 76),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Browse all",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    child: Wrap(
                        alignment: WrapAlignment.spaceAround,
                        runAlignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 18,
                        runSpacing: 18,
                        children: [
                          ...searchCardList
                              .map(
                                (searchCard) => SearchCard(data: searchCard),
                              )
                              .toList(),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchHeader extends StatelessWidget {
  const SearchHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Search",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        Expanded(child: Container()),
        const Icon(
          Icons.camera_alt_outlined,
          size: 30,
        ),
      ],
    );
  }
}
