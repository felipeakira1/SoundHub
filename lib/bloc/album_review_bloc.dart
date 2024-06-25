// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:soundhub/data_providers/firebase_authentication_service.dart';
import 'package:soundhub/data_providers/firestore_album_review_data_provider.dart';
import 'package:soundhub/models/album_review.dart';

class AlbumReviewBloc extends Bloc<AlbumReviewEvents, AlbumReviewState> {
  final FirebaseAuthenticationService _firebaseAuthenticationService = FirebaseAuthenticationService();
  final FirestoreAlbumReviewDataProvider _firestoreAlbumReviewDataProvider = FirestoreAlbumReviewDataProvider();

  AlbumReviewBloc() : super(AddAlbumReviewLoading()) {    
    on<CheckForExistingReview>((event, emit) async {
      emit(AlbumReviewLoading());
      User? user = _firebaseAuthenticationService.getCurrentUser();
      if(user != null) {
        try {
          AlbumReview? review = await _firestoreAlbumReviewDataProvider.fetchAlbumReviewByUserIdAndAlbumId(user.uid, event.albumId);
          if(review != null) {
            emit(ExistingReviewFound(review: review));
          } else {
            emit(NoExistingReview());
          }
        } catch(e) {
          emit(AlbumReviewError(message: e.toString()));
        }
      } else {
        emit(AlbumReviewError(message: 'User not found'));
      }
    });
    on<SubmitAlbumReview>((event, emit) async {
      emit(AddAlbumReviewLoading());
      User? currentUser = _firebaseAuthenticationService.getCurrentUser();
      if(currentUser != null) {
        try {
          AlbumReview albumReview = AlbumReview(
            rating: event.rating, 
            description: event.description, 
            albumId: event.albumId, 
            userId: currentUser.uid,
          );
          await _firestoreAlbumReviewDataProvider.addAlbumReview(albumReview);
          emit(AddAlbumReviewSuccess(albumReview: albumReview));
        } catch(e) {
          emit(AddAlbumReviewFailure(message: '$e'));
        }
      } else {
        emit(AddAlbumReviewFailure(message: 'User not found while adding album review'));
      }
    });
  }
  
}

/*
  Events
*/
abstract class AlbumReviewEvents {}

class CheckForExistingReview extends AlbumReviewEvents {
  final String albumId;

  CheckForExistingReview({required this.albumId});
}

class SubmitAlbumReview extends AlbumReviewEvents {
  int rating;
  String description;
  String albumId;
  
  SubmitAlbumReview({
    required this.rating,
    required this.description,
    required this.albumId,
  });
}

/*
  States
*/

abstract class AlbumReviewState {}

class AlbumReviewLoading extends AlbumReviewState {}

class ExistingReviewFound extends AlbumReviewState {
  final AlbumReview review;

  ExistingReviewFound({required this.review});
}

class NoExistingReview extends AlbumReviewState {}

class AlbumReviewError extends AlbumReviewState {
  String message;
  AlbumReviewError({
    required this.message,
  });
}

class AddAlbumReviewLoading extends AlbumReviewState {}

class AddAlbumReviewSuccess extends AlbumReviewState {
  final AlbumReview albumReview;

  AddAlbumReviewSuccess({required this.albumReview});
}

class AddAlbumReviewFailure extends AlbumReviewState {
  final String message;
  AddAlbumReviewFailure({
    required this.message,
  });
}