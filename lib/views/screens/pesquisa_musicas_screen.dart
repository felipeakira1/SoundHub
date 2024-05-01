import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:soundhub/models/album.dart';
import 'package:soundhub/managers/albuns_musicas_manager.dart';
import 'package:soundhub/models/musica.dart';
import 'package:soundhub/views/widgets/album_tile.dart';
import 'package:soundhub/views/widgets/app_bars.dart';
import 'package:soundhub/views/widgets/drawer.dart';
import 'package:soundhub/views/widgets/musica_tile.dart';

class TelaDePesquisaMusicas extends StatefulWidget {
  @override
  _TelaDePesquisaMusicasState createState() => _TelaDePesquisaMusicasState();
}

class _TelaDePesquisaMusicasState extends State<TelaDePesquisaMusicas> {
  String _query = '';
  List<Musica> _searchResults = AlbumMusicsManager().musicas; // Lista para armazenar os resultados da pesquisa
  int _selectedIndex = 0;

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
                  child: Text('Pesquisar musicas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)
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
                    _searchResults = AlbumMusicsManager().pesquisarMusicas(_query);
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Digite aqui o nome da musica...',
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
                  return MusicaTile(musica: _searchResults[index]);
                },
              ),
            ),
          ],
        ),
    );
  }

  void _onItemTapped(int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }
}
