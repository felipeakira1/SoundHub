import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/search_artist_bloc.dart';
import 'package:soundhub/widgets/artist_tile.dart';

class SearchArtistsPage extends StatefulWidget {
  const SearchArtistsPage({super.key});

  @override
  State<SearchArtistsPage> createState() => _SearchArtistsPageState();
}

class _SearchArtistsPageState extends State<SearchArtistsPage> {
  @override
  void initState() {
    super.initState();
    context.read<SearchArtistBloc>().add(SearchArtistQuery(query: ''));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text('Search artists', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          Focus(
            child: TextField(
              onSubmitted: (value) => context.read<SearchArtistBloc>().add(SearchArtistQuery(query: value)),
              decoration: const InputDecoration(
                hintText: 'Type the name of the artist...',
                contentPadding: EdgeInsets.all(16.0)
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchArtistBloc, SearchArtistState>(
              builder: (context, state) {
                if(state is SearchArtistEmpty) {
                  return const Center(child: Text('Artist not found'),);
                } else if (state is SearchArtistLoaded) {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.60,
                    ),
                    itemCount: state.searchedArtists.length,
                    itemBuilder: (context, index) {
                      final artist = state.searchedArtists[index];
                      return ArtistTile(artist: artist);
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator(),);
                }
              },
            )
          ),
        ],
      ),
    );
  }
}