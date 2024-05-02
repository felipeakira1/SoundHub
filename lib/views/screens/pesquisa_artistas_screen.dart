import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:soundhub/managers/albuns_musicas_manager.dart';
import 'package:soundhub/models/artista.dart';
import 'package:soundhub/views/widgets/artista_tile.dart';

class TelaDePesquisaArtistas extends StatefulWidget {
  @override
  _TelaDePesquisaArtistasState createState() => _TelaDePesquisaArtistasState();
}

class _TelaDePesquisaArtistasState extends State<TelaDePesquisaArtistas> {
  String _query = '';
  List<Artista> _searchResults = AlbumMusicsManager().artistas; // Lista para armazenar os resultados da pesquisa

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8.0),
                child: Text('Pesquisar artistas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _query = value;
                  // Atualiza os resultados da pesquisa sempre que o texto do campo de pesquisa é alterado
                  _searchResults = AlbumMusicsManager().pesquisarArtistas(_query);
                });
              },
              decoration: const InputDecoration(
                hintText: 'Digite aqui o nome do artista...',
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.65 // Proporção desejada entre largura e altura
              ),
              itemCount: _searchResults.length,
              shrinkWrap: true, // Certifica-se de que o GridView não ocupe mais espaço do que o necessário
              itemBuilder: (BuildContext context, int index) {
                return ArtistaTile(artista: _searchResults[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
