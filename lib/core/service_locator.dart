
import 'package:clean_architecture_movie_db/core/features/movie_detail/data_layer/repository/movie_detail_repository.dart';
import 'package:clean_architecture_movie_db/core/features/movie_detail/presentation_layer/cubit/movie_detail_cubit.dart';
import 'package:get_it/get_it.dart';

import 'features/movie_detail/data_layer/datasource/remote_data_source_md.dart';
import 'features/movie_detail/domain_layer/usecase/movie_details.dart';
import 'features/search_movie/data_layer/datasource/remote_data_source.dart';
import 'features/search_movie/data_layer/repository/movie_repository.dart';
import 'features/search_movie/domain_layer/usecase/search_movies.dart';
import 'features/search_movie/presentation_layer/bloc/movie_search_bloc.dart';

final sl = GetIt.instance;

void setupLocator() {
  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

  // Repositories
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => SearchMovies(sl()));

  // Blocs
  sl.registerFactory(() => MovieSearchBloc(sl()));

  sl.registerLazySingleton<RemoteDataSourceMD>(() => RemoteDataSourceMDImpl());

  sl.registerLazySingleton<MovieDetailRepository>(() => MovieDetailRepositoryImpl(sl()));

  sl.registerLazySingleton(() => MovieDetails(sl()));

  sl.registerFactory(() => MovieDetailCubit(sl()));
}
