import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundhub/data_providers/firestore_artist_data_provider.dart';
import 'package:soundhub/models/artist.dart';
class SearchArtistBloc extends Bloc<SearchArtistEvent, SearchArtistState> {
  final FirestoreArtistDataProvider _firestoreArtistDataProvider = FirestoreArtistDataProvider();

  SearchArtistBloc() : super(SearchArtistLoading()) {
    on<SearchArtistQuery>((event, emit) async {
      emit(SearchArtistLoading());
      try {
        List<Artist> searchedArtists = await _firestoreArtistDataProvider.searchArtists(event.query);
        if(searchedArtists.isEmpty) {
          emit(SearchArtistEmpty());
        } else {
          emit(SearchArtistLoaded(searchedArtists: searchedArtists));
        }
      } catch(e) {
        emit(SearchArtistError(message: e.toString()));
      }
    });
  }
}

/*
  Events
*/

abstract class SearchArtistEvent {}

class SearchArtistQuery extends SearchArtistEvent {
  String query;
  SearchArtistQuery({
    required this.query,
  });
}

/*
  States
*/
abstract class SearchArtistState {}

class SearchArtistLoading extends SearchArtistState {}

class SearchArtistLoaded extends SearchArtistState {
  List<Artist> searchedArtists;
  SearchArtistLoaded({
    required this.searchedArtists,
  });
}

final class SearchArtistEmpty extends SearchArtistState {}

final class SearchArtistError extends SearchArtistState {
  String message;

  SearchArtistError({required this.message});
}

