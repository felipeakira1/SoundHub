import 'package:soundhub/models/album.dart';

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