// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:soundhub/models/album_review.dart';

abstract class AlbumReviewsState {}

class AlbumReviewsInitial extends AlbumReviewsState {}

class AlbumReviewsLoading extends AlbumReviewsState {}

class AlbumReviewsLoaded extends AlbumReviewsState {
  List<AlbumReview> albumReviews;
  
  AlbumReviewsLoaded({
    required this.albumReviews,
  });
}

class AlbumReviewsEmpty extends AlbumReviewsState {}

class AlbumReviewsError extends AlbumReviewsState {
  String message;
  AlbumReviewsError({
    required this.message,
  });
}

class AddAlbumReviewLoading extends AlbumReviewsState {}

class AddAlbumReviewSuccess extends AlbumReviewsState {
  final AlbumReview albumReview;

  AddAlbumReviewSuccess({required this.albumReview});
}

class AddAlbumReviewFailure extends AlbumReviewsState {
  final String message;
  AddAlbumReviewFailure({
    required this.message,
  });
}
