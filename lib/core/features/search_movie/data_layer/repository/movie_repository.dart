
import '../datasource/remote_data_source.dart';
import '../models/movie_list_model.dart';

abstract class MovieRepository {
  Future<MovieListModel> searchMovies(String query, int page);
}

class MovieRepositoryImpl implements MovieRepository {
  final RemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<MovieListModel> searchMovies(String query, int page) async {
    return await remoteDataSource.searchMovies(query, page);
  }
}
