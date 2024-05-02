import 'package:flutter/material.dart';
import 'package:soundhub/views/widgets/app_bars.dart';
import 'package:soundhub/models/album.dart';
import 'package:soundhub/managers/albuns_musicas_manager.dart';
import 'package:soundhub/views/widgets/album_tile.dart';
import 'package:soundhub/views/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AlbumMusicsManager albumManager = AlbumMusicsManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
      drawer: SoundHubDrawer(),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            buildSection('Albuns Pop', 'Pop'),
            buildSection('Albuns Rock', 'Rock'),
            buildSection('Albuns Sertanejo', 'Sertanejo'),
          ],
        ),
      ),

    );
  }

  Widget buildSection(String title, String genero) {
    List<Album> albumsGenero = albumManager.albums.where((album) => album.genero == genero).toList();

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
        Container(
            height: 223,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: albumsGenero.length,
                itemBuilder: (context, index) {
                  return AlbumTile(album: albumsGenero[index]);
                }
            )
        ),
      ],
    );
  }
}