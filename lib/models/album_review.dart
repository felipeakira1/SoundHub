import 'package:soundhub/models/album.dart';

class AlbumReview {
  late String uid;
  final int rating;
  final String description;
  final String userId;
  final String albumId;
  late Album album;

  AlbumReview({
    required this.rating,
    required this.description,
    required this.albumId,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rating': rating,
      'description': description,
      'albumId': albumId,
      'userId': userId,
    };
  }

  factory AlbumReview.fromMap(Map<String, dynamic> map) {
    return AlbumReview(
      rating: map['rating'] as int,
      description: map['description'] as String,
      albumId: map['albumId'] as String,
      userId: map['userId'] as String,
    );
  }
}
