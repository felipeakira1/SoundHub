import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:soundhub/models/artista.dart';
import 'package:soundhub/views/widgets/album_tile.dart';
import 'package:soundhub/views/widgets/app_bars.dart';

class TelaDetalhesArtista extends StatelessWidget {
  final Artista artista;
  const TelaDetalhesArtista({super.key, required this.artista});

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
                  child: Image.asset(artista.imageUrl),
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage(artista.imageUrl),
                  //     fit: BoxFit.cover,
                  //   ),
                  //   borderRadius: BorderRadius.circular(10.0),
                  // ),
                ),
                SizedBox(height: 20),
                Text(artista.nome, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
                Text("Gênero Musical: ${artista.generoMusical}", style: TextStyle(fontSize: 18, color: Colors.white),),
                Text("Nascido em: ${artista.anoNascimento}", style: TextStyle(fontSize: 18, color: Colors.white),),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Biografia", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(artista.biografia, style: TextStyle(fontSize: 16, color: Colors.white), textAlign: TextAlign.justify),
                ),
                SizedBox(height: 20),
                artista.albuns != null ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Álbuns", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(), // to disable ListView's scrolling
                      itemCount: artista.albuns!.length,
                      itemBuilder: (context, index) {
                        return AlbumTile(album: artista.albuns![index]); // Substitua por seu próprio widget de álbum
                      },
                    ),
                  ],
                ) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
