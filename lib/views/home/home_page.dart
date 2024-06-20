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

  Widget buildSection(String title, String genero, List<Album> albums) {
    List<Album> albumsGenero = [];
    for (var element in albums) {
      if(element.genre == genero) {
        albumsGenero.add(element);
      }
    }

    if (albumsGenero.isEmpty) {
      return Center(child: Text("No albums found for the genre $genero"));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 8),
        Container(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: albumsGenero.length,
            itemBuilder: (context, index) {
              return AlbumTile(album: albumsGenero[index]);
            },
          ),
        ),
      ],
    );
  }
}
