part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class GetMovieNowPlayingList extends MovieEvent {

  const GetMovieNowPlayingList();

  @override
  List<Object> get props => [];
}

class GetMovieTrendingList extends MovieEvent {

  const GetMovieTrendingList();

  @override
  List<Object> get props => [];
}