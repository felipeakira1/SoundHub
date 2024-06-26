// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:soundhub/data_providers/firebase_authentication_service.dart';
import 'package:soundhub/data_providers/firestore_album_review_data_provider.dart';
import 'package:soundhub/models/album_review.dart';

class UserAlbumReviewsBloc extends Bloc<UserAlbumReviewsEvent, UserAlbumReviewsState> {
  final FirebaseAuthenticationService _firebaseAuthenticationService = FirebaseAuthenticationService();
  final FirestoreAlbumReviewDataProvider _firestoreAlbumReviewDataProvider = FirestoreAlbumReviewDataProvider();

  UserAlbumReviewsBloc() : super(UserAlbumReviewsLoading()) {
    on<LoadUserAlbumReviews>((event, emit) async {
      emit(UserAlbumReviewsLoading());
      User? user = _firebaseAuthenticationService.getCurrentUser();
      if(user != null) {
        try {
          List<AlbumReview> reviews = await _firestoreAlbumReviewDataProvider.fetchAlbumReviewsByUserId(user.uid);
          if(reviews.isNotEmpty) {
            emit(UserAlbumReviewsLoaded(reviews: reviews));
          } else {
            emit(UserAlbumReviewsEmpty());
          }
        } catch (e) {
          emit(UserAlbumReviewsError(message: e.toString()));
        }
      }
    });
    on<DeleteUserAlbumReview>((event, emit) async {
      emit(UserAlbumReviewsLoading());
      User? user = _firebaseAuthenticationService.getCurrentUser();
      if(user != null) {
        try {
          await _firestoreAlbumReviewDataProvider.deleteAlbumReview(event.albumReviewId);
          add(LoadUserAlbumReviews());
        } catch(e) {
          emit(UserAlbumReviewsError(message: e.toString()));
        }
      }
    });
  }
}
/*
  Events
*/
abstract class UserAlbumReviewsEvent {}

class LoadUserAlbumReviews extends UserAlbumReviewsEvent {}

class DeleteUserAlbumReview extends UserAlbumReviewsEvent{
  String albumReviewId;
  DeleteUserAlbumReview({
    required this.albumReviewId,
  });
}

/*
  States
*/
abstract class UserAlbumReviewsState {}

class UserAlbumReviewsLoading extends UserAlbumReviewsState {}

class UserAlbumReviewsLoaded extends UserAlbumReviewsState {
  List<AlbumReview> reviews;

  UserAlbumReviewsLoaded({required this.reviews});
}

class UserAlbumReviewsEmpty extends UserAlbumReviewsState {}

class UserAlbumReviewsError extends UserAlbumReviewsState {
  String message;

  UserAlbumReviewsError({required this.message});
}