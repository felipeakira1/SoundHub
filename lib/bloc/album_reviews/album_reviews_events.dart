// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class AlbumReviewsEvents {}

class LoadAlbumReviews extends AlbumReviewsEvents {}

class AddAlbumReview extends AlbumReviewsEvents {
  int rating;
  String description;
  String albumId;
  
  AddAlbumReview({
    required this.rating,
    required this.description,
    required this.albumId,
  });
}
