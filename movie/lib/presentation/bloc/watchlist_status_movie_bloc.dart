import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/entities/movie_detail.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../movie.dart';
 
part 'watchlist_status_movie_event.dart';
part 'watchlist_status_movie_state.dart';

class WatchlistStatusMovieBloc extends Bloc<WatchlistStatusMovieEvent, WatchlistStatusMovieState> {
  
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetWatchListStatus getWatchListStatus;
  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;

  WatchlistStatusMovieBloc(
    this.getWatchListStatus,
    this.saveWatchlist,
    this.removeWatchlist
    ) : super(WatchlistStatusMovieEmpty());

  @override
  Stream<WatchlistStatusMovieState> mapEventToState(
    WatchlistStatusMovieEvent event,
  ) async* {
    if (event is IsMovieWatchlisted) {
      final id = event.id;

      yield WatchlistStatusMovieLoading();
      final result = await getWatchListStatus.execute(id);
      yield WatchlistStatusMovie(result);
    } else if (event is AddMovieWatchlist) {
      final movie = event.movie;

      final result = await saveWatchlist.execute(movie);
      yield* result.fold(
        (failure) async* {
          yield WatchlistStatusMovieError(failure.message);
        },
        (data) async* {
          yield WatchlistMessageMovie(data);
        },
      );
    } else if (event is RemoveMovieWatchlist) {
      final movie = event.movie;

      final result = await removeWatchlist.execute(movie);
      yield* result.fold(
        (failure) async* {
          yield WatchlistStatusMovieError(failure.message);
        },
        (data) async* {
          yield WatchlistMessageMovie(data);
        },
      );
    }  
  }
}
