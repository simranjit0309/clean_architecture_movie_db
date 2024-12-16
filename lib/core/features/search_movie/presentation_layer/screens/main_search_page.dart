import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../movie_detail/presentation_layer/screens/movie_details_page.dart';
import '../../data_layer/models/movie_list_model.dart';
import '../bloc/movie_search_bloc.dart';
import 'package:marquee/marquee.dart';

class MainSearchPage extends StatelessWidget {
  const MainSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movieBloc = BlocProvider.of<MovieSearchBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie DB"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchField(movieBloc),
            Expanded(
              child: BlocBuilder<MovieSearchBloc, SearchMovieState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ResponseState) {
                    return _buildMovieGrid(state.movieList, movieBloc);
                  } else if (state is ErrorState) {
                    return Center(child: Text(state.errorMsg));
                  }
                  return const Center(child: Text("Search for a movie"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField(MovieSearchBloc movieBloc) {
    return TextField(
      onSubmitted: (query) {
        movieBloc.add(SearchMovieEvent(query));
      },
      decoration: const InputDecoration(
        hintText: "Enter a movie name",
        suffixIcon: Icon(Icons.search),
      ),
    );
  }

  Widget _buildMovieGrid(List<Search> movieList, MovieSearchBloc movieBloc) {
    return  GridView.builder(
//controller: movieBloc.scrollController,
      itemCount: movieList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx,index){
        final movieListData = movieList.elementAt(index);
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: (){
              Navigator.push(
                ctx,
                MaterialPageRoute(builder: (ctx) => MovieDetailsPage(movieName: movieListData.title,)),
              );
            },
            child: GridTile(
              footer:  GridTileBar(
                backgroundColor: Colors.black87,
                title: movieList.elementAt(index).title!.length>14?Marquee(
                  blankSpace: 25.0,
                  velocity: 40.0,
                  text:movieListData.title??"",

                ):Text(movieListData.title??"",textAlign: TextAlign.center,),
              ),
              child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: movieListData.poster??"",
                  placeholder: (ctx, url) =>  Image.asset('images/placeholder.jpg'),
                  errorWidget: (ctx, url, error) =>  Image.asset('images/error_image.jpg')
              ),
            ),
          ),
        );
      },

    );
  }
}
