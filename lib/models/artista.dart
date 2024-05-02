import 'package:soundhub/models/album.dart';

class Artista {
  final String _nome;
  final int _anoNascimento;
  final String _generoMusical;
  final String _biografia;
  final String _imageUrl;
  final List<Album>? _albuns;

  Artista({
    required String nome,
    required int anoNascimento,
    required String generoMusical,
    required String biografia,
    required String imageUrl,
    List<Album>? albuns,
  })  : _nome = nome,
        _anoNascimento = anoNascimento,
        _generoMusical = generoMusical,
        _biografia = biografia,
        _imageUrl = imageUrl,
        _albuns = albuns;

  String get nome => _nome;
  int get anoNascimento => _anoNascimento;
  String get generoMusical => _generoMusical;
  String get biografia => _biografia;
  String get imageUrl => _imageUrl;
  List<Album>? get albuns => _albuns;
}
