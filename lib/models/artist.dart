class Artist {
  final String _name;
  final int _birthYear;
  final List<String> _musicalGenres;
  final String _biography;
  final String _imageUrl;

  Artist({
    required String name,
    required int birthYear,
    required List<String> musicalGenres,
    required String biography,
    required String imageUrl,
  })  : _name = name,
        _birthYear = birthYear,
        _musicalGenres = musicalGenres,
        _biography = biography,
        _imageUrl = imageUrl;

  String get name => _name;
  int get birthYear => _birthYear;
  List<String> get musicalGenres => _musicalGenres;
  String get biography => _biography;
  String get imageUrl => _imageUrl;

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      name: json['name'] ?? 'Unknown Artist',
      birthYear: json['birthYear'] ?? 0,
      musicalGenres: (json['musicalGenres'] as List).map((genre) => genre.toString()).toList(),
      biography: json['biography'] ?? 'No biography available',
      imageUrl: json['imageUrl'] ?? '',
    );
}

}
