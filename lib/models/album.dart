import 'package:soundhub/models/musica.dart';

class Album {
  final String _nome;
  final int _ano;
  final String _genero;
  final String _artista;
  final String _imageUrl;
  final List<Musica> _musicas = [];

  Album({required String nome, required int ano, required String genero, required String artista, required String imageUrl,
  })  : _nome = nome, _ano = ano, _genero = genero, _artista = artista, _imageUrl = imageUrl;

  String get nome => _nome;
  int get ano => _ano;
  String get genero => _genero;
  String get artista => _artista;
  String get imageUrl => _imageUrl;
  List<Musica> get musicas => _musicas;
}