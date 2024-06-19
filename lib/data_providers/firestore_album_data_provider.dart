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
    await _firestore.collection('albuns').add(album.toMap()).then((value) => print("Added ALBUM"));
  }

  Future<List<Album>> getAllAlbuns() async {
    QuerySnapshot querySnapshot = await _firestore.collection('albuns').get();

    List<Album> albuns = [];

    querySnapshot.docs.forEach((element) {
      Album album = Album(
        name: element['name'] ?? '',
        genre: element['genre'] ?? '',
        year: element['year'] ?? 0,
        artistId: element['artistId'] ?? '',
        imageUrl: element['imageUrl'] ?? '',
      );
      albuns.add(album);
    });
    
    albuns.forEach((element) => print(element.genre));
    return albuns;
  }

  Stream<QuerySnapshot> get albunsStream {
    return _firestore.collection('albuns').snapshots();
  }
}