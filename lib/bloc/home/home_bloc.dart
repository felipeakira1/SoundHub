import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soundhub/bloc/home/home_event.dart';
import 'package:soundhub/bloc/home/home_state.dart';
import 'package:soundhub/data_providers/firestore_album_data_provider.dart';
import 'package:soundhub/models/album.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FirestoreAlbumDataProvider _albumDataProvider = FirestoreAlbumDataProvider();

  HomeBloc() : super(HomeInitial()) {
    _albumDataProvider.albunsStream.listen((QuerySnapshot snapshot) {
      add(LoadHomePage());
    });

    on<LoadHomePage>((LoadHomePage event, Emitter<HomeState> emit) async {
      emit(HomeLoading());
      try {
        List<Album> albuns = await _albumDataProvider.getAllAlbuns();
        emit(HomeLoaded(albuns: albuns));
      } catch(e) {
        emit(HomeError(message: 'Error: ${e}'));
      }
    });
  }
}
