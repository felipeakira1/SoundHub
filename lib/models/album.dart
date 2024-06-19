import 'package:cloud_firestore/cloud_firestore.dart';

class Album {
  final String name;
  final String genre;
  final int year;
  final String artistId;
  final String imageUrl;

  Album({
    required this.name,
    required this.genre,
    required this.year,
    required this.artistId,
    required this.imageUrl,
  });

  factory Album.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Album(
      name: data['name'] ?? '',
      genre: data['genre'] ?? '',
      year: data['year'] ?? 0,
      artistId: data['artistId'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
    );
  }

  get ano => null;

  get musicas => null;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'genre': genre,
      'year': year,
      'artistId': artistId,
      'imageUrl': imageUrl,
      // No need to include songs here since they will be managed separately
    };
  }
}
