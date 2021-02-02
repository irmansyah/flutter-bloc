import 'package:flutter_bloc_movie/data/data_providers/movie_api.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc_movie/data/models/models.dart';

class MovieRepository {
  final MovieApi movieApi;

  const MovieRepository({@required this.movieApi});

  Future<Movie> getMovieNowPlayingList() {
    return movieApi.getMovieNowPlayingList();
  }
}