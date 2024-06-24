

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soundhub/models/artist.dart';

class FirestoreArtistDataProvider {
  static final FirestoreArtistDataProvider _instance = FirestoreArtistDataProvider._internal();

  FirestoreArtistDataProvider._internal();

  factory FirestoreArtistDataProvider() {
    return _instance;
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Artist> fetchArtistById(String artistId) async {
    DocumentSnapshot doc = await _firestore.collection('artists').doc(artistId).get();
    if(doc.exists) {
      return Artist.fromJson(doc.data() as Map<String, dynamic>);
    } else {
      throw Exception('Artist not found');
    }
  }
}