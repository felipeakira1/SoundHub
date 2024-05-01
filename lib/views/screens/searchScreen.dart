import 'package:flutter/material.dart';
import 'package:soundhub/models/album.dart';
import 'package:soundhub/models/albuns_musicas_manager.dart';
import 'package:soundhub/views/widgets/album_tile.dart';

class TelaDePesquisa extends StatefulWidget {
  @override
  _TelaDePesquisaState createState() => _TelaDePesquisaState();
}

class _TelaDePesquisaState extends State<TelaDePesquisa> {
  String _query = '';
  List<Album> _searchResults =
      []; // Lista para armazenar os resultados da pesquisa

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesquisa'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _query = value;
                  // Atualiza os resultados da pesquisa sempre que o texto do campo de pesquisa é alterado
                  _searchResults = AlbumMusicsManager().searchAlbums(_query);
                });
              },
              decoration: InputDecoration(
                hintText: 'Digite aqui o nome do álbum...',
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
          ),
          Expanded(
            // Lista para exibir os resultados da pesquisa
            child: Container(
              
              height: 250,
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final album = _searchResults[index];
                  return AlbumTile(album: album);
                  // return ListTile(
                  //   title: Text(album.nome),
                  //   subtitle: Text(album.autor),
                  //   // Adicione aqui a navegação para a tela de detalhes do álbum ao ser clicado
                  //   onTap: () {
                  //     // Adicione a navegação para a tela de detalhes do álbum aqui
                  //   },
                  // );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
