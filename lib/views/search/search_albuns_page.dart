import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/search/search_album_bloc.dart';
import 'package:soundhub/bloc/search/search_album_event.dart';
import 'package:soundhub/bloc/search/search_album_state.dart';
import 'package:soundhub/widgets/album_tile.dart';

class SearchAlbunsPage extends StatefulWidget {
  const SearchAlbunsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchAlbunsPageState createState() => _SearchAlbunsPageState();
}

class _SearchAlbunsPageState extends State<SearchAlbunsPage> {
  @override
  void initState() {
    super.initState();
    context.read<SearchAlbumBloc>().add(SearchAlbumQuery(query: ''));
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Pesquisar álbuns',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Focus(
          child: TextField(
            onSubmitted: (value) {
              context.read<SearchAlbumBloc>().add(SearchAlbumQuery(query: value));
            },
            decoration: const InputDecoration(
              hintText: 'Digite aqui o nome do álbum...',
              contentPadding: EdgeInsets.all(16.0),
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<SearchAlbumBloc, SearchAlbumState>(
            builder: (context, state) {
              if (state is SearchAlbumEmpty) {
                return Center(child: Text('Nenhum álbum encontrado.'));
              } else if (state is SearchAlbumLoaded) {
                final albuns = state.searchedAlbuns;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Número de colunas na grade
                    crossAxisSpacing: 8.0, // Espaçamento entre as colunas
                    mainAxisSpacing: 8.0, // Espaçamento entre as linhas
                    childAspectRatio: 0.60, // Proporção da altura em relação à largura do item
                  ),
                  itemCount: albuns.length,
                  itemBuilder: (context, index) {
                    final album = albuns[index];
                    return AlbumTile(album: album);
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}
