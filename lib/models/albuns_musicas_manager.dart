import 'album.dart';
import 'musica.dart';

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


  void adicionarAlbum(Album album) {
    _albums.add(album);
  }

  void adicionarMusica(Musica musica) {
    _musicas.add(musica);
    if (musica.album != null) {
      musica.album!.musicas.add(musica);
    }
  }
  
  List<Album> get albums => _albums;

  List<Musica> get musicas => _musicas;

  // Método para buscar álbuns com base na consulta de pesquisa
  List<Album> searchAlbums(String query) {
    // Filtrar os álbuns cujo nome contenha a consulta de pesquisa
    return _albums
      .where(
        (album) => album.nome.toLowerCase().contains(query.toLowerCase()))
      .toList();

  }
}