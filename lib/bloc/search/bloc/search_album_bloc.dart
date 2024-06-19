import 'package:bloc/bloc.dart';
import 'package:soundhub/bloc/search/bloc/search_album_event.dart';
import 'package:soundhub/bloc/search/bloc/search_album_state.dart';
import 'package:soundhub/data_providers/firestore_album_data_provider.dart';
import 'package:soundhub/models/album.dart';

class SearchAlbumBloc extends Bloc<SearchAlbumEvent, SearchAlbumState> {
  final FirestoreAlbumDataProvider _firestoreAlbumDataProvider = FirestoreAlbumDataProvider();

  SearchAlbumBloc() : super(SearchAlbumInitial()) {
    on<SearchAlbumQuery>((event, emit) async {
      print(event.query);
      try {
        emit(SearchAlbumLoading());
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
