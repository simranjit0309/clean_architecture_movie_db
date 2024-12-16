
import '../../data_layer/models/movie_list_model.dart';
import '../../data_layer/repository/movie_repository.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<MovieListModel> call(String query, int page) async {
    return await repository.searchMovies(query, page);
  }
}
