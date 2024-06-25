


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soundhub/data_providers/firestore_album_data_provider.dart';
import 'package:soundhub/models/album_review.dart';

class FirestoreAlbumReviewDataProvider {
  static final FirestoreAlbumReviewDataProvider _instance = FirestoreAlbumReviewDataProvider._internal();

  FirestoreAlbumReviewDataProvider._internal();

  factory FirestoreAlbumReviewDataProvider() {
    return _instance;
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirestoreAlbumDataProvider _firestoreAlbumDataProvider = FirestoreAlbumDataProvider();

  Future<void> addAlbumReview (AlbumReview review) async {
    DocumentReference docRef = await _firestore.collection('albumreviews').add(review.toMap());
    await docRef.update({'uid': docRef.id});
  }

  Future<AlbumReview?> fetchAlbumReviewByUserIdAndAlbumId(String userId, String albumId) async {
    var snapshot = await _firestore.collection('albumreviews').where('userId', isEqualTo: userId).where('albumId', isEqualTo: albumId).limit(1).get();
    if(snapshot.docs.isNotEmpty) {
      AlbumReview albumReview = AlbumReview.fromMap(snapshot.docs.first.data());
      albumReview.album = await _firestoreAlbumDataProvider.fetchAlbumById(albumReview.albumId);
      return albumReview;
    }
    return null;
  }

  Future<List<AlbumReview>> fetchAlbumReviewsByUserId(String userId) async {
    QuerySnapshot snapshot = await _firestore.collection('albumreviews').where('userId', isEqualTo: userId).get();
    List<AlbumReview> reviews = [];
    for(var doc in snapshot.docs) {
      AlbumReview albumReview = AlbumReview.fromMap(doc.data() as Map<String, dynamic>);
      albumReview.album = await _firestoreAlbumDataProvider.fetchAlbumById(albumReview.albumId);
      reviews.add(albumReview);
    }
    return reviews;
  }
}