import 'package:soundhub/models/album.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  List<Album> albuns;

  HomeLoaded({required this.albuns});
}

final class HomeError extends HomeState {
  String message;

  HomeError({required this.message});
}