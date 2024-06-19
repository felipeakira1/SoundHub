import 'package:soundhub/models/artista.dart';

import '../models/album.dart';
import '../models/musica.dart';

class AlbumMusicsManager {
  // Instancia singleton
  static final AlbumMusicsManager _instance = AlbumMusicsManager._internal();

  // Construtor privado
  AlbumMusicsManager._internal();

  // Factory method to access the singleton
  factory AlbumMusicsManager() {
    return _instance;
  }

  final List<Album> _albums = [];
  final List<Musica> _musicas = [];
  final List<Artista> _artistas = [];



  void adicionarAlbum(Album album) {
    _albums.add(album);
  }

  void adicionarMusica(Musica musica) {
    _musicas.add(musica);
    if (musica.album != null) {
      musica.album!.musicas.add(musica);
    }
  }

  void adicionarArtista(Artista artista) {
    _artistas.add(artista);
  }
  
  List<Album> get albums => _albums;

  List<Musica> get musicas => _musicas;

  List<Artista> get artistas => _artistas;

  // Método para buscar álbuns com base na consulta de pesquisa
  List<Album> pesquisarAlbums(String query) {
    // Filtrar os álbuns cujo nome contenha a consulta de pesquisa
    return _albums
      .where(
        (album) => album.name.toLowerCase().contains(query.toLowerCase()))
      .toList();

  }

  List<Musica> pesquisarMusicas(String query) {
    // Filtrar os álbuns cujo nome contenha a consulta de pesquisa
    return _musicas
      .where(
        (musica) => musica.nome.toLowerCase().contains(query.toLowerCase()))
      .toList();

  }

  List<Artista> pesquisarArtistas(String query) {
    // Filtrar os álbuns cujo nome contenha a consulta de pesquisa
    return _artistas
      .where(
        (artista) => artista.name.toLowerCase().contains(query.toLowerCase()))
      .toList();

  }
}