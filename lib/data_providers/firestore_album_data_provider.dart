import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soundhub/data_providers/firestore_artist_data_provider.dart';
import 'package:soundhub/models/album.dart';
import 'package:soundhub/models/artist.dart';

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
  final FirestoreArtistDataProvider _firestoreArtistDataProvider = FirestoreArtistDataProvider();
  
  Future<void> addAlbum(Album album) async {
    await _firestore.collection('albums').add(album.toMap());
  }

  Future<List<Album>> getAllAlbums() async {
    QuerySnapshot querySnapshot = await _firestore.collection('albums').get();
    List<Album> albums = [];

    for (var doc in querySnapshot.docs) {
      var albumData = doc.data() as Map<String, dynamic>;
      Album album = Album.fromMap(albumData);
      Artist artist = await _firestoreArtistDataProvider.fetchArtistById(album.artistId);
      album.artistName = artist.name;
      albums.add(album);
    }
    return albums;
  }

  Future<List<Album>> searchAlbums(String query) async {
    String lowerCaseQuery = query.toLowerCase();
    List<Album> allAlbums = await getAllAlbums();
    List<Album> filteredAlbums = allAlbums.where((album) {
      return album.name.toLowerCase().contains(lowerCaseQuery);
    }).toList();
    return filteredAlbums;
  }

  Stream<QuerySnapshot> get albumsStream {
    return _firestore.collection('albums').snapshots();
  }
}