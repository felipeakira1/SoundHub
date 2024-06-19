import 'package:flutter/material.dart';
import 'package:soundhub/views/search/pesquisa_albuns_screen.dart';
import 'package:soundhub/views/search/pesquisa_artistas_screen.dart';
import 'package:soundhub/views/search/pesquisa_musicas_screen.dart';
import 'package:soundhub/widgets/app_bars.dart';
import 'package:soundhub/widgets/drawer.dart';

class PesquisaTabBarNavigation extends StatefulWidget {
  const PesquisaTabBarNavigation({super.key});

  @override
  State<PesquisaTabBarNavigation> createState() => _PesquisaTabBarNavigationState();
}

class _PesquisaTabBarNavigationState extends State<PesquisaTabBarNavigation> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SoundHub'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.album), text: 'Álbuns'),
            Tab(icon: Icon(Icons.music_note), text: 'Músicas'),
            Tab(icon: Icon(Icons.person), text: 'Artistas'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SearchAlbunsPage(),
          TelaDePesquisaMusicas(),
          TelaDePesquisaArtistas()
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}

void main() => runApp(MaterialApp(home: PesquisaTabBarNavigation()));
