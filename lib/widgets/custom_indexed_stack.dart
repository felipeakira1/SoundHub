import 'package:flutter/material.dart';
import 'package:soundhub/views/home/home_page.dart';
import 'package:soundhub/views/profile/perfil_screen.dart';
import 'package:soundhub/views/search/pesquisa_albuns_screen.dart';

class CustomIndexedStack extends StatelessWidget {
  final int currentIndex;
  final List<Widget> screens = [
    HomePage(),
    SearchAlbunsPage(),
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
