// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SearchAlbumEvent {}

class SearchAlbumQuery extends SearchAlbumEvent {
  String query;
  SearchAlbumQuery({
    required this.query,
  });
}
