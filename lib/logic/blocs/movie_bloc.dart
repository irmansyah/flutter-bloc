import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc_movie/data/models/movie.dart';
import 'package:flutter_bloc_movie/data/repositories/movie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {

  final MovieRepository movieRepository;

  MovieBloc({@required this.movieRepository}) : super(null);

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if (event is GetMovieNowPlayingList) {
      yield* _mapGetMovieNowPlayingToState(event);
    }
  }

  Stream <MovieState> _mapGetMovieNowPlayingToState(GetMovieNowPlayingList event) async* {
    yield MovieLoading();
    try {
      final Movie movie = await movieRepository.getMovieNowPlayingList();
      yield MovieLoaded(movie: movie);
    } catch (_) {
      yield MovieError(message: 'Unable to fetch weather');
    }
  }
}
