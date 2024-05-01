import 'package:soundhub/models/album.dart';

class Musica {
  final String _nome;
  final int _ano;
  final String _genero;
  final String _artista;
  final String _imageUrl;
  final Album? _album;

  Musica({required String nome, required int ano, required String genero, required String artista, required String imageUrl, Album? album,
  })  : _nome = nome, _ano = ano, _genero = genero, _artista = artista, _imageUrl = imageUrl, _album = album;

  String get nome => _nome;
  int get ano => _ano;
  String get genero => _genero;
  String get artista => _artista;
  String get imageUrl => _imageUrl;
  Album? get album => _album;
}