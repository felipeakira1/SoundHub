

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soundhub/models/artist.dart';

class FirestoreArtistDataProvider {
  static final FirestoreArtistDataProvider _instance = FirestoreArtistDataProvider._internal();

  FirestoreArtistDataProvider._internal();

  factory FirestoreArtistDataProvider() {
    return _instance;
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addArtist(Artist artist) async {
    DocumentReference docRef = await _firestore.collection('artists').add(artist.toMap());
    // Add uid field to the doc
    await docRef.update({'uid': docRef.id});
  }

  Future<List<Artist>> fetchAllArtists() async {
    QuerySnapshot snapshot = await _firestore.collection('artists').get();
    List<Artist> artists = [];
    for(var doc in snapshot.docs) {
      Artist artist = Artist.fromMap(doc.data() as Map<String, dynamic>);
      artists.add(artist);
    }
    return artists;
  }

  Future<Artist> fetchArtistById(String artistId) async {
    DocumentSnapshot doc = await _firestore.collection('artists').doc(artistId).get();
    if(doc.exists) {
      return Artist.fromMap(doc.data() as Map<String, dynamic>);
    } else {
      throw Exception('Artist not found');
    }
  }

  Future<List<Artist>> searchArtists(String query) async {
    String lowerCaseQuery = query.toLowerCase();
    List<Artist> allArtists = await fetchAllArtists();
    List<Artist> filteredArtists = allArtists.where((artist) {
      return artist.name.toLowerCase().contains(lowerCaseQuery);
    }).toList();
    return filteredArtists;
  }
}