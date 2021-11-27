import 'package:core/domain/entities/tv_detail.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../tv.dart';
 
part 'watchlist_status_tv_event.dart';
part 'watchlist_status_tv_state.dart';

class WatchlistStatusTvBloc extends Bloc<WatchlistStatusTvEvent, WatchlistStatusTvState> {
  
  static const watchlistAddSuccessMessage = 'Added to Watchlist Tv';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist Tv';
  static const watchlistInitilaMessage = 'Watchlist';

  final GetWatchListStatusTv getWatchListStatus;
  final SaveWatchlistTv saveWatchlist;
  final RemoveWatchlistTv removeWatchlist;

  WatchlistStatusTvBloc(
    this.getWatchListStatus,
    this.saveWatchlist,
    this.removeWatchlist
    ) : super(WatchlistStatusTvEmpty());

  @override
  Stream<WatchlistStatusTvState> mapEventToState(
    WatchlistStatusTvEvent event,
  ) async* {
    if (event is IsTvWatchlisted) {
      final id = event.id;

      yield WatchlistStatusTvLoading();
      final result = await getWatchListStatus.execute(id);
      yield WatchlistStatusTv(result, watchlistInitilaMessage);
    } else if (event is AddTvWatchlist) {
      final tv = event.tv;

      final result = await saveWatchlist.execute(tv);
      yield* result.fold(
        (failure) async* {
          yield WatchlistStatusTvError(failure.message);
        },
        (data) async* {
          yield WatchlistStatusTv(true, data);
        },
      );
    } else if (event is RemoveTvWatchlist) {
      final tv = event.tv;

      final result = await removeWatchlist.execute(tv);
      yield* result.fold(
        (failure) async* {
          yield WatchlistStatusTvError(failure.message);
        },
        (data) async* {
          yield WatchlistStatusTv(false, data);
        },
      );
    }  
  }
}
