
import '../../data_layer/datasource/remote_data_source.dart';
import '../../data_layer/models/movie_list_model.dart';

abstract class MovieRepository {
  Future<MovieListModel> searchMovies(String query, int page);
}


