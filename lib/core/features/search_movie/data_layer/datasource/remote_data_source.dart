
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/movie_list_model.dart';

abstract class RemoteDataSource {
  Future<MovieListModel> searchMovies(String query, int page);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final String _baseUrl = "https://www.omdbapi.com/";
  final String _apiKey = "7aeca8c8";

  @override
  Future<MovieListModel> searchMovies(String query, int page) async {
    final response = await http.get(Uri.parse("$_baseUrl?s=$query&page=$page&apikey=$_apiKey"));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return MovieListModel.fromJson(json);
    } else {
      throw Exception("Failed to fetch movies");
    }
  }
}
