part of 'movie_search_bloc.dart';

abstract class SearchMovieState {}

class InitialState extends SearchMovieState {}

class LoadingState extends SearchMovieState {}

class ResponseState extends SearchMovieState {
  final List<Search> movieList;

  ResponseState(this.movieList);
}

class PaginatedState extends SearchMovieState {
  final List<Search> movieList;

  PaginatedState(this.movieList);
}

class ErrorState extends SearchMovieState {
  final String errorMsg;

  ErrorState(this.errorMsg);
}
