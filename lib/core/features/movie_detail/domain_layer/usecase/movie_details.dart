
import 'package:clean_architecture_movie_db/core/features/movie_detail/data_layer/models/movie_detail_model.dart';
import '../../data_layer/repository/movie_detail_repository.dart';

class MovieDetails {
  final MovieDetailRepository repository;

  MovieDetails(this.repository);

  Future<MovieDetailModel> call(String query) async {
    return await repository.getMovieDetail(query );
  }
}
