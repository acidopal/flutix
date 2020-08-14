import 'package:bloc/bloc.dart';
import 'package:bwa_flutix/models/models.dart';
import 'package:bwa_flutix/services/services.dart';
import 'package:equatable/equatable.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  void fetchMovie() async {
    List<Movie> movies = await MovieServices.getMovies(1);
    emit(MovieLoadedState(movies: movies));
  }
}
