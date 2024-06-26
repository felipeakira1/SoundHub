import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/search_album_bloc.dart';
import 'package:soundhub/bloc/search_artist_bloc.dart';
import 'package:soundhub/views/search/search_albuns_page.dart';
import 'package:soundhub/views/search/search_artists_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.album), text: 'Albuns'),
              Tab(icon: Icon(Icons.person), text: 'Artists'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                BlocProvider(
                  create: (context) => SearchAlbumBloc(),
                  child: const SearchAlbunsPage(),
                ),
                BlocProvider(
                  create: (context) => SearchArtistBloc(),
                  child: const SearchArtistsPage(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
