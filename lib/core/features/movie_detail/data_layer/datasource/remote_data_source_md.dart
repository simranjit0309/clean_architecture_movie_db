
import 'package:clean_architecture_movie_db/core/features/movie_detail/data_layer/models/movie_detail_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


abstract class RemoteDataSourceMD {
  Future<MovieDetailModel> getMovieDetail(String movieName);
}

class RemoteDataSourceMDImpl implements RemoteDataSourceMD {
  final String _baseUrl = "https://www.omdbapi.com/";
  final String _apiKey = "7aeca8c8";



  @override
  Future<MovieDetailModel> getMovieDetail(String movieName) async {
    final response = await http.get(Uri.parse("$_baseUrl?t=$movieName&plot=full&apikey=$_apiKey"));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return MovieDetailModel.fromJson(json);
    } else {
      throw Exception("Failed to fetch movies");
    }
  }
}
