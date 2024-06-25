import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/album_reviews/album_reviews_events.dart';
import 'package:soundhub/bloc/album_reviews/album_reviews_state.dart';
import 'package:soundhub/data_providers/firebase_authentication_service.dart';
import 'package:soundhub/data_providers/firestore_album_review_data_provider.dart';
import 'package:soundhub/models/album_review.dart';

class AlbumReviewsBloc extends Bloc<AlbumReviewsEvents, AlbumReviewsState> {
  final FirebaseAuthenticationService _firebaseAuthenticationService = FirebaseAuthenticationService();
  FirestoreAlbumReviewDataProvider _firestoreAlbumReviewDataProvider = FirestoreAlbumReviewDataProvider();

  AlbumReviewsBloc() : super(AlbumReviewsInitial()) {
    on<LoadAlbumReviews>((event, emit) async {
      emit(AlbumReviewsLoading());
    });
    
    on<AddAlbumReview>((event, emit) async {
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