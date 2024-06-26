import 'package:soundhub/models/artist.dart';

class Album {
  String? uid;
  final String name;
  final String genre;
  final int year;
  final String imageUrl;
  final List<String> musics;
  final String artistId;
  late Artist artist;


  Album({
    this.uid,
    required this.name,
    required this.genre,
    required this.year,
    required this.imageUrl,
    required this.musics,
    required this.artistId,
  });

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(
      uid: map['uid'] as String,
      name: map['name'] ?? '',
      genre: map['genre'] ?? '',
      year: map['year'] ?? 0,
      imageUrl: map['imageUrl'] ?? '',
      musics: (map['musics'] as List<dynamic>).map((music) => music.toString()).toList(),
      artistId: map['artistId'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'ui': uid,
      'name': name,
      'genre': genre,
      'year': year,
      'imageUrl': imageUrl,
      'musics': musics,
      'artistId': artistId,
    };
  }
}
