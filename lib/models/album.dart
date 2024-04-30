class Album {
  final String _nome;
  final int _ano;
  final String _genero;
  final String _autor;
  final String _imageUrl;

  Album({required String nome, required int ano, required String genero, required String autor, required String imageUrl,
  })  : _nome = nome, _ano = ano, _genero = genero, _autor = autor, _imageUrl = imageUrl;

  String get nome => _nome;
  int get ano => _ano;
  String get genero => _genero;
  String get autor => _autor;
  String get imageUrl => _imageUrl;

}