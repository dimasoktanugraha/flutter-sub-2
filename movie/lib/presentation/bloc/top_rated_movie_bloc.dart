import 'package:core/domain/entities/movie.dart';
import 'package:movie/domain/usecases/get_top_rated_movies.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
 
part 'top_rated_movie_event.dart';
part 'top_rated_movie_state.dart';

class TopRatedMovieBloc extends Bloc<TopRatedMovieEvent, TopRatedMovieState> {
  final GetTopRatedMovies _getTopRatedMovies;

  TopRatedMovieBloc(this._getTopRatedMovies) : super(TopRatedMovieEmpty());

  @override
  Stream<TopRatedMovieState> mapEventToState(
    TopRatedMovieEvent event,
  ) async* {
    if (event is GetTopRatedMovieData) {
 
    yield TopRatedMovieLoading();
    final result = await _getTopRatedMovies.execute();
 
    yield* result.fold(
      (failure) async* {
        yield TopRatedMovieError(failure.message);
      },
      (data) async* {
        yield TopRatedMovieHasData(data);
        },
      );
    }
  }
}
