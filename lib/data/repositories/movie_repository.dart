import 'package:flutter_bloc_movie/data/data_providers/data_providers.dart';
import 'package:flutter_bloc_movie/data/models/models.dart';

class MovieRepository {
  final MovieApi movieApi;

  const MovieRepository({required this.movieApi});

  Future<Movie> getMovieNowPlayingList() {
    return movieApi.getMovieNowPlayingList();
  }
}
