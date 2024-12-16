

import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/features/movie_detail/presentation_layer/cubit/movie_detail_cubit.dart';
import 'core/features/movie_detail/presentation_layer/screens/movie_details_page.dart';
import 'core/features/search_movie/presentation_layer/bloc/movie_search_bloc.dart';
import 'core/features/search_movie/presentation_layer/screens/main_search_page.dart';
import 'core/service_locator.dart';
import 'package:flutter/material.dart';
void main() {
  setupLocator();
  runApp(
    MultiBlocProvider(

        providers: [
          BlocProvider(
            create: (context) => sl<MovieSearchBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<MovieDetailCubit>(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MovieDB',
          home: const MainSearchPage(),
          routes: {
            '/main_page': (ctx) => const MainSearchPage(),
            '/movie_detail': (ctx) =>  const MovieDetailsPage(),
          },
        )),
  );

}
