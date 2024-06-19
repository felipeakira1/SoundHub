import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/search/bloc/search_album_bloc.dart';
import 'package:soundhub/views/home/home_page.dart';
import 'package:soundhub/views/profile/perfil_screen.dart';
import 'package:soundhub/views/search/search_albuns_page.dart';
import 'package:soundhub/views/search/search_page.dart';

class CustomIndexedStack extends StatelessWidget {
  final int currentIndex;
  final List<Widget> screens = [
    const HomePage(),
    const SearchPage(),
    const TelaPerfil(),
  ];

  CustomIndexedStack({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentIndex,
      children: screens,
    );
  }
}
