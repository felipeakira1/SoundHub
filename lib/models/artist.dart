class Artist {
  final String name;
  final int birthYear;
  final List<String> musicalGenres;
  final String biography;
  final String imageUrl;

  Artist({
    required this.name,
    required this.birthYear,
    required this.musicalGenres,
    required this.biography,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'birthYear': birthYear,
      'musicalGenres': musicalGenres,
      'biography': biography,
      'imageUrl': imageUrl,
    };
  }

  factory Artist.fromMap(Map<String, dynamic> map) {
    return Artist(
      name: map['name'] as String,
      birthYear: map['birthYear'] as int,
      musicalGenres: (map['musicalGenres'] as List<dynamic>).map((genre) => genre.toString()).toList(),
      biography: map['biography'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }
}
