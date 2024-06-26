import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/data_providers/firestore_album_data_provider.dart';
import 'package:soundhub/models/album.dart';

class DetailsArtistBloc extends Bloc<DetailsArtistEvent, DetailsArtistState> {
  final FirestoreAlbumDataProvider _firestoreAlbumDataProvider = FirestoreAlbumDataProvider();
  DetailsArtistBloc() : super(AlbumsLoading()) {
    on<FetchAlbums>((event, emit) async {
      emit(AlbumsLoading());
      try {
        List<Album> albums = await _firestoreAlbumDataProvider.fetchAlbumsByArtistId(event.artistId);
        if(albums.isNotEmpty) {
          emit(AlbumsLoaded(albums: albums));
        } else {
          emit(AlbumsEmpty());
        }
      } catch(e) {
        emit(AlbumsError(message: e.toString()));
      }
    });
  }
}


/*
  Events
*/

abstract class DetailsArtistEvent {}

class FetchAlbums extends DetailsArtistEvent {
  final String artistId;

  FetchAlbums({required this.artistId});
}

/*
  States
*/

abstract class DetailsArtistState {}

class AlbumsLoading extends DetailsArtistState {}

class AlbumsLoaded extends DetailsArtistState {
  final List<Album> albums;

  AlbumsLoaded({required this.albums});
}

class AlbumsEmpty extends DetailsArtistState {}

class AlbumsError extends DetailsArtistState {
  final String message;

  AlbumsError({required this.message});
}