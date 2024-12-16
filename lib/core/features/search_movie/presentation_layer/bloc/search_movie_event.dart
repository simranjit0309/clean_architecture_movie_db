part of 'movie_search_bloc.dart';

abstract class MovieEvent {}

class SearchMovieEvent extends MovieEvent {
  final String query;

  SearchMovieEvent(this.query);
}

class PaginateMovieEvent extends MovieEvent {
  final String query;
  final List<Search> movieList;

  PaginateMovieEvent(this.query, this.movieList);
}
