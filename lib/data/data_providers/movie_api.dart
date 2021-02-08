import 'dart:convert';

import 'package:flutter_bloc_movie/data/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class MovieApi {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const apiKey = 'b607c4a709f1c7b173cdf2e63c87eb90';
  final http.Client httpClient;

  const MovieApi({@required this.httpClient});

  Future<Movie> getMovieNowPlayingList() async {
    final String nowPlayingUrl = '$baseUrl/movie/now_playing?api_key=' + apiKey;
    final http.Response response = await httpClient.get(nowPlayingUrl);
    if (response.statusCode != 200) {
      throw Exception('Failure');
    }
    final Map<String, dynamic> movieListJson = json.decode(response.body);
    print('Movie List Json : ${movieListJson.length}');
    return Movie.fromJson(movieListJson);
  }
}