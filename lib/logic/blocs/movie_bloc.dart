import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_movie/data/models/models.dart';
import 'package:flutter_bloc_movie/data/repositories/repositories.dart';
import 'package:meta/meta.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {

  final MovieRepository _movieRepository;

  MovieBloc({
    @required MovieRepository movieRepository,
    }) : assert(movieRepository != null),
        _movieRepository = movieRepository,
        super(MovieLoading());

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
    print('_mapGetMovieNowPlayingToState : ');

    try {
      final Movie movie = await _movieRepository.getMovieNowPlayingList();
      yield MovieLoaded(movie: movie);
    } catch (_) {
      yield MovieError(message: 'Unable to fetch movie');
    }
  }
}
