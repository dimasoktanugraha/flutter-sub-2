import 'package:core/domain/entities/movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../movie.dart';
 
part 'watchlist_movie_event.dart';
part 'watchlist_movie_state.dart';

class WatchlistMovieBloc extends Bloc<WatchlistMovieEvent, WatchlistMovieState> {
  final GetWatchlistMovies _getWatchlistMovies;

  WatchlistMovieBloc(this._getWatchlistMovies) : super(WatchlistMovieEmpty());

  @override
  Stream<WatchlistMovieState> mapEventToState(
    WatchlistMovieEvent event,
  ) async* {
    if (event is GetWatchlistMovieData) {
 
    yield WatchlistMovieLoading();
    final result = await _getWatchlistMovies.execute();
 
    yield* result.fold(
      (failure) async* {
        yield WatchlistMovieError(failure.message);
      },
      (data) async* {
        yield WatchlistMovieHasData(data);
        },
      );
    }
  }
}
