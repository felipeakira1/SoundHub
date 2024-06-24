import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/home/home_bloc.dart';
import 'package:soundhub/bloc/home/home_event.dart';
import 'package:soundhub/bloc/home/home_state.dart';
import 'package:soundhub/models/album.dart';
import 'package:soundhub/widgets/album_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(LoadHomePage()),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              return _buildLoaded(state.albuns);
            } else if (state is HomeError) {
              return _buildError(state.message);
            } else {
              return _buildLoading();
            }
          },
        ),
      )
    );
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildLoaded(List<Album> albums) {
    return ListView(
      children: [
        buildSection('Albuns Pop', "Pop", albums),
        buildSection('Albuns Pop', "Rock", albums),
        buildSection('Albuns Pop', "Sertanejo", albums),
      ],
    );
  }

  Widget _buildError(String message) {
    return Center(child: Text("Error: $message"));
  }

  Widget buildSection(String title, String genre, List<Album> albums) {
    var albumsByGenre = albums.where((album) => album.genre == genre).toList();

    if (albumsByGenre.isEmpty) {
      return Center(
        child: Text(
          "No albums found for the genre $genre",
          style: const TextStyle(color: Colors.white70),
        )
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: albumsByGenre.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10,),
            itemBuilder: (context, index) {
              return AlbumTile(album: albumsByGenre[index]);
            },
          ),
        ),
      ],
    );
  }
}
