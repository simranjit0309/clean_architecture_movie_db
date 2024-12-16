import '../../data_layer/models/movie_detail_model.dart';

abstract class MovieDetailRepository {
  Future<MovieDetailModel> getMovieDetail(String query);
}
