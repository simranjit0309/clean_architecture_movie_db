import '../datasource/remote_data_source.dart';
import '../models/movie_list_model.dart';
import '../../domain_layer/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final RemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<MovieListModel> searchMovies(String query, int page) async {
    return await remoteDataSource.searchMovies(query, page);
  }
}