import 'package:flutter/material.dart';
import 'package:soundhub/views/screens/pesquisa_albuns_screen.dart';
import 'package:soundhub/views/screens/pesquisa_musicas_screen.dart';
import 'package:soundhub/views/widgets/app_bars.dart';
import 'package:soundhub/views/widgets/drawer.dart';

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
    _tabController = TabController(length: 2, vsync: this);
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
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          TelaDePesquisaAlbuns(),
          TelaDePesquisaMusicas(),
        ],
      ),
      drawer: SoundHubDrawer(),
    );
  }
}

void main() => runApp(MaterialApp(home: PesquisaTabBarNavigation()));
