part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieInitial extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieLoadedState extends MovieState {
  final List<Movie> movies;

  MovieLoadedState({this.movies});

  @override
  List<Object> get props => [movies];
}
