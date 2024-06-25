import 'package:flutter/material.dart';
import 'package:soundhub/views/home/home_page.dart';
import 'package:soundhub/views/profile/profile_page.dart';
import 'package:soundhub/views/search/search_page.dart';

class CustomIndexedStack extends StatelessWidget {
  final int currentIndex;

  const CustomIndexedStack({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentIndex,
      children: const [
        HomePage(),
        SearchPage(),
        ProfilePage(),
      ],
    );
  }
}
