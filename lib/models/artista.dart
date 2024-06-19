import 'package:soundhub/models/album.dart';

class Artista {
  final String _name;
  final int _birthYear;
  final String _musicalGenre;
  final String _biography;
  final String _imageUrl;
  final List<Album>? _albuns;

  Artista({
    required String nome,
    required int anoNascimento,
    required String generoMusical,
    required String biografia,
    required String imageUrl,
    List<Album>? albuns,
  })  : _name = nome,
        _birthYear = anoNascimento,
        _musicalGenre = generoMusical,
        _biography = biografia,
        _imageUrl = imageUrl,
        _albuns = albuns;

  String get name => _name;
  int get birthYear => _birthYear;
  String get musicalGenre => _musicalGenre;
  String get biography => _biography;
  String get imageUrl => _imageUrl;
  List<Album>? get albuns => _albuns;
}
