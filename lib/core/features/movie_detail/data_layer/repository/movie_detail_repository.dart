

import '../datasource/remote_data_source_md.dart';
import '../models/movie_detail_model.dart';

abstract class MovieDetailRepository {
  Future<MovieDetailModel> getMovieDetail(String query);
}

class MovieDetailRepositoryImpl implements MovieDetailRepository {
  final RemoteDataSourceMD remoteDataSource;

  MovieDetailRepositoryImpl(this.remoteDataSource);

  @override
  Future<MovieDetailModel> getMovieDetail(String query) async {
    return await remoteDataSource.getMovieDetail(query);
  }
}
