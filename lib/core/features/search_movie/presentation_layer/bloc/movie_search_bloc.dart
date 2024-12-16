import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_layer/models/movie_list_model.dart';
import '../../domain_layer/usecase/search_movies.dart';




part 'search_movie_event.dart';
part 'search_movie_state.dart';

class MovieSearchBloc extends Bloc<MovieEvent, SearchMovieState> {
  final SearchMovies searchMovies;
  int page = 1;
  bool isPagination = false;

  MovieSearchBloc(this.searchMovies) : super(InitialState()) {
    on<SearchMovieEvent>(_onSearchMovies);
    on<PaginateMovieEvent>(_onPaginateMovies);
  }

  Future<void> _onSearchMovies(SearchMovieEvent event, Emitter<SearchMovieState> emit) async {
    emit(LoadingState());
    try {
      page = 1;
      final result = await searchMovies(event.query, page);
      emit(ResponseState(result.search ?? []));
    } catch (e) {
      emit(ErrorState("Failed to fetch movies"));
    }
  }

  Future<void> _onPaginateMovies(PaginateMovieEvent event, Emitter<SearchMovieState> emit) async {
    if (isPagination) return;

    isPagination = true;
    try {
      final result = await searchMovies(event.query, ++page);
      emit(PaginatedState(event.movieList..addAll(result.search ?? [])));
    } catch (e) {
      emit(ErrorState("Failed to load more movies"));
    } finally {
      isPagination = false;
    }
  }
}
