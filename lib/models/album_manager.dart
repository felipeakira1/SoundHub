import 'album.dart';

class AlbumManager {
  static final AlbumManager _instance = AlbumManager._internal();
  final List<Album> _albums = [];

  factory AlbumManager() {
    return _instance;
  }

  AlbumManager._internal();

  List<Album> get albums => _albums;

  void add(Album album) {
    _albums.add(album);
  }

  // Método para buscar álbuns ocm base na consulta de pesquisa
  List<Album> searchAlbums(String query) {
    // Filtrar os álbuns cujo nome ocntenha a consulta de pesquisa
    return _albums
      .where(
        (album) => album.nome.toLowerCase().contains(query.toLowerCase()))
      .toList();

  }
}