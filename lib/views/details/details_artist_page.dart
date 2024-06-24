import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:soundhub/models/artist.dart';
import 'package:soundhub/widgets/album_tile.dart';
import 'package:soundhub/widgets/app_bars.dart';

class DetailsArtistPage extends StatelessWidget {
  final Artist artist;
  const DetailsArtistPage({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReturnAppBar(),  // Supondo que você tenha uma AppBar com funcionalidade de retorno
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8, // 80% da largura da tela
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.width * 0.6,
                  child: Image.asset(artist.imageUrl),
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage(artista.imageUrl),
                  //     fit: BoxFit.cover,
                  //   ),
                  //   borderRadius: BorderRadius.circular(10.0),
                  // ),
                ),
                const SizedBox(height: 20),
                Text(artist.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
                Text("Musical genres: ${artist.musicalGenres}", style: const TextStyle(fontSize: 18, color: Colors.white),),
                Text("Nascido em: ${artist.birthYear}", style: const TextStyle(fontSize: 18, color: Colors.white),),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Biography", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(artist.biography, style: TextStyle(fontSize: 16, color: Colors.white), textAlign: TextAlign.justify),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
