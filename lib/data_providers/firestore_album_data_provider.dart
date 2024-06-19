import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soundhub/models/album.dart';

class FirestoreAlbumDataProvider {
  // Instancia singleton
  static final FirestoreAlbumDataProvider _instance = FirestoreAlbumDataProvider._internal();

  // Construtor privado
  FirestoreAlbumDataProvider._internal();

  // Factory method to access the singleton
  factory FirestoreAlbumDataProvider() {
    return _instance;
  }

  // Adaptar para classe abstrata
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addAlbum(Album album) async {
    await _firestore.collection('albuns').add(album.toMap());
  }

  Future<List<Album>> getAllAlbuns() async {
    QuerySnapshot querySnapshot = await _firestore.collection('albuns').get();

    List<Album> albuns = [];

    for (var element in querySnapshot.docs) {
      Album album = Album(
        name: element['name'] ?? '',
        genre: element['genre'] ?? '',
        year: element['year'] ?? 0,
        artistId: element['artistId'] ?? '',
        imageUrl: element['imageUrl'] ?? '',
      );
      albuns.add(album);
    }
    return albuns;
  }

  Future<List<Album>> searchAlbums(String query) async {
    String lowerCaseQuery = query.toLowerCase();
    List<Album> allAlbuns = await getAllAlbuns();
    List<Album> filteredAlbuns = allAlbuns.where((album) {
      return album.name.toLowerCase().contains(lowerCaseQuery);
    }).toList();
    return filteredAlbuns;
  }

  Stream<QuerySnapshot> get albunsStream {
    return _firestore.collection('albuns').snapshots();
  }
}