import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:flutter_bloc_movie/data/models/movie.dart';

class MovieApi {
  static const baseUrl = 'https://api.themoviedb.org/3';
  final http.Client httpClient;

  const MovieApi({@required this.httpClient});

  Future<Movie> getMovieNowPlayingList() async {
    final String nowPlayingUrl = '$baseUrl/movie/now_playing?api_key=';
    final http.Response response = await httpClient.get(nowPlayingUrl);
    if (response.statusCode != 200) {
      throw Exception('Failure');
    }
    final Map<String, dynamic> movieListJson = json.decode(response.body);
    print('Movie List Json : ${movieListJson.length}');
    return Movie.fromJson(movieListJson);
  }
}