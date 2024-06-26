// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:soundhub/data_providers/firebase_authentication_service.dart';
import 'package:soundhub/data_providers/firestore_album_review_data_provider.dart';
import 'package:soundhub/models/album_review.dart';

class AlbumReviewBloc extends Bloc<AlbumReviewEvents, AlbumReviewState> {
  final FirebaseAuthenticationService _firebaseAuthenticationService = FirebaseAuthenticationService();
  final FirestoreAlbumReviewDataProvider _firestoreAlbumReviewDataProvider = FirestoreAlbumReviewDataProvider();

  AlbumReviewBloc() : super(AlbumReviewInitial()) {    
    on<LoadAlbumReview>((event, emit) async {
      emit(AlbumReviewLoading());
      User? user = _firebaseAuthenticationService.getCurrentUser();
      if(user != null) {
        try {
          AlbumReview? review = await _firestoreAlbumReviewDataProvider.fetchAlbumReviewByUserIdAndAlbumId(user.uid, event.albumId);
          if(review != null) {
            emit(AlbumReviewFound(review: review));
          } else {
            emit(AlbumReviewNotFound());
          }
        } catch(e) {
          emit(AlbumReviewError(message: e.toString()));
        }
      } else {
        emit(AlbumReviewError(message: 'User not found'));
      }
    });
    on<SubmitAlbumReview>((event, emit) async {
      emit(AlbumReviewLoading());
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
          emit(AlbumReviewSubmitted(albumReview: albumReview));
        } catch(e) {
          emit(AlbumReviewFailure(message: '$e'));
        }
      } else {
        emit(AlbumReviewFailure(message: 'User not found while adding album review'));
      }
    });
    on<UpdateAlbumReview>((event, emit) async {
      emit(AlbumReviewLoading());
      try {
        await _firestoreAlbumReviewDataProvider.updateAlbumReview(event.reviewId, event.rating, event.description);
        emit(AlbumReviewUpdated());
      } catch(e) {
        emit(AlbumReviewFailure(message: e.toString()));
      }
    });
  }
  
}

/*
  Events
*/
abstract class AlbumReviewEvents {}

class LoadAlbumReview extends AlbumReviewEvents {
  final String albumId;

  LoadAlbumReview({required this.albumId});
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

class UpdateAlbumReview extends AlbumReviewEvents {
  int rating;
  String description;
  String reviewId;

  UpdateAlbumReview({
    required this.rating,
    required this.description,
    required this.reviewId,
  });
}

/*
  States
*/

abstract class AlbumReviewState {}

class AlbumReviewInitial extends AlbumReviewState {}

class AlbumReviewLoading extends AlbumReviewState {}

// CheckForExistingReview
class AlbumReviewNotFound extends AlbumReviewState {}

class AlbumReviewFound extends AlbumReviewState {
  final AlbumReview review;

  AlbumReviewFound({required this.review});
}


class AlbumReviewError extends AlbumReviewState {
  String message;
  AlbumReviewError({
    required this.message,
  });
}

class AlbumReviewSubmitted extends AlbumReviewState {
  AlbumReview albumReview;
  AlbumReviewSubmitted({
    required this.albumReview,
  });
}

class AlbumReviewUpdated extends AlbumReviewState {}

class AlbumReviewFailure extends AlbumReviewState {
  final String message;

  AlbumReviewFailure({required this.message});
}