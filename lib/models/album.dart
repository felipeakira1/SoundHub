class Album {
  String? uid;
  final String name;
  final String genre;
  final int year;
  final String imageUrl;
  final String artistId;
  String? artistName;


  Album({
    this.uid,
    required this.name,
    required this.genre,
    required this.year,
    required this.artistId,
    required this.imageUrl,
  });

  factory Album.fromMap(Map<String, dynamic> data) {
    return Album(
      uid: data['uid'] as String,
      name: data['name'] ?? '',
      genre: data['genre'] ?? '',
      year: data['year'] ?? 0,
      artistId: data['artistId'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'ui': uid,
      'name': name,
      'genre': genre,
      'year': year,
      'artistId': artistId,
      'imageUrl': imageUrl,
      // No need to include songs here since they will be managed separately
    };
  }
}
