import 'package:bloc/bloc.dart';
import 'package:soundhub/data_providers/firestore_album_data_provider.dart';
import 'package:soundhub/models/album.dart';

class SearchAlbumBloc extends Bloc<SearchAlbumEvent, SearchAlbumState> {
  final FirestoreAlbumDataProvider _firestoreAlbumDataProvider = FirestoreAlbumDataProvider();

  SearchAlbumBloc() : super(SearchAlbumInitial()) {
    on<SearchAlbumQuery>((event, emit) async {
      emit(SearchAlbumLoading());
      try {
        List<Album> searchedAlbuns = await _firestoreAlbumDataProvider.searchAlbums(event.query);
        if(searchedAlbuns.isEmpty) {
          emit(SearchAlbumEmpty());
        } else {
          emit(SearchAlbumLoaded(searchedAlbuns: searchedAlbuns));
        }
      } catch(e) {
        emit(SearchAlbumError(message: 'Erro: $e'));
      }
    });
  }
}

/*
  Events
*/
abstract class SearchAlbumEvent {}

class SearchAlbumQuery extends SearchAlbumEvent {
  String query;
  SearchAlbumQuery({
    required this.query,
  });
}


/*
  States
*/
abstract class SearchAlbumState {}

final class SearchAlbumInitial extends SearchAlbumState {}

final class SearchAlbumLoading extends SearchAlbumState {}

final class SearchAlbumLoaded extends SearchAlbumState {
  List<Album> searchedAlbuns;

  SearchAlbumLoaded({required this.searchedAlbuns});
}

final class SearchAlbumEmpty extends SearchAlbumState {}

final class SearchAlbumError extends SearchAlbumState {
  String message;

  SearchAlbumError({required this.message});
}