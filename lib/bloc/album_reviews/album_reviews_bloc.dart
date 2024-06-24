import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/bloc/album_reviews/album_reviews_events.dart';
import 'package:soundhub/bloc/album_reviews/album_reviews_state.dart';

class AlbumReviewsBloc extends Bloc<AlbumReviewsEvents, AlbumReviewsState> {
  AlbumReviewsBloc() : super(AlbumReviewsInitial()) {
    on<LoadAlbumReviews>((event, emit) async {
      emit(AlbumReviewsLoading());
      
    });
  }
  
}