


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soundhub/models/album_review.dart';

class FirestoreAlbumReviewDataProvider {
  static final FirestoreAlbumReviewDataProvider _instance = FirestoreAlbumReviewDataProvider._internal();

  FirestoreAlbumReviewDataProvider._internal();

  factory FirestoreAlbumReviewDataProvider() {
    return _instance;
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addAlbumReview (AlbumReview review) async {
    await _firestore.collection('albumreviews').add(review.toMap());
  }

  Future<List<AlbumReview>> fetchAlbumReviewsByUserId(String userId) async {
    QuerySnapshot snapshot = await _firestore.collection('albumreviews').where('userId', isEqualTo: userId).get();
    List<AlbumReview> reviews = [];
    for(var doc in snapshot.docs) {
      AlbumReview albumReview = AlbumReview.fromMap(doc.data() as Map<String, dynamic>);
      reviews.add(albumReview);
    }
    return reviews;
  }
}