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
}