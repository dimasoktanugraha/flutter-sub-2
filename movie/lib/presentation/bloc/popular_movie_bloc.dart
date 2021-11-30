import 'package:core/domain/entities/movie.dart';
import 'package:movie/domain/usecases/get_popular_movies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
 
part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  final GetPopularMovies _getPopularMovies;

  PopularMovieBloc(this._getPopularMovies) : super(PopularMovieEmpty());

  @override
  Stream<PopularMovieState> mapEventToState(
    PopularMovieEvent event,
  ) async* {
    if (event is GetPopularMovieData) {
 
    yield PopularMovieLoading();
    final result = await _getPopularMovies.execute();
 
    yield* result.fold(
      (failure) async* {
        yield PopularMovieError(failure.message);
      },
      (data) async* {
        yield PopularMovieHasData(data);
        },
      );
    }
  }
}
