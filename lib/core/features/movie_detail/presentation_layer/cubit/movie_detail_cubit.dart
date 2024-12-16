import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_layer/models/movie_detail_model.dart';

import '../../domain_layer/usecase/movie_details.dart';
import 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState>{
  final MovieDetails movieDetails;
  MovieDetailModel movieDetail = MovieDetailModel();
  MovieDetailCubit(this.movieDetails) : super(InitialState()){
  }


  void getMovie(String movieName) async {
    try {
      emit(LoadingState());
      var response = await movieDetails(movieName);
      if(response.response == "True") {
        movieDetail = response;
        print(movieDetail);
        emit(ResponseState(movieDetail));
      }else{
        emit(ErrorState(movieDetail.error??"Something wen wrong"));
      }
    }catch(e){
      emit(ErrorState("Something wen wrong"));
    }finally{

    }
  }

}