import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/data_providers/firebase_authentication_service.dart';
import 'package:soundhub/data_providers/firestore_album_review_data_provider.dart';
import 'package:soundhub/models/album_review.dart';

class AlbumReviewsBloc extends Bloc<AlbumReviewsEvents, AlbumReviewState> {
  final FirebaseAuthenticationService _firebaseAuthenticationService = FirebaseAuthenticationService();
  final FirestoreAlbumReviewDataProvider _firestoreAlbumReviewDataProvider = FirestoreAlbumReviewDataProvider();

  AlbumReviewsBloc() : super(AddAlbumReviewLoading()) {    
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
abstract class AlbumReviewsEvents {}

class SubmitAlbumReview extends AlbumReviewsEvents {
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