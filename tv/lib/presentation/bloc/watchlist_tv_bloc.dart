import 'package:core/domain/entities/tv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../tv.dart';
 
part 'watchlist_tv_event.dart';
part 'watchlist_tv_state.dart';

class WatchlistTvBloc extends Bloc<WatchlistTvEvent, WatchlistTvState> {
  final GetWatchlistTvs _getWatchlistTv;

  WatchlistTvBloc(this._getWatchlistTv) : super(WatchlistTvEmpty());

  @override
  Stream<WatchlistTvState> mapEventToState(
    WatchlistTvEvent event,
  ) async* {
    if (event is GetWatchlistTvData) {
 
    yield WatchlistTvLoading();
    final result = await _getWatchlistTv.execute();
 
    yield* result.fold(
      (failure) async* {
        yield WatchlistTvError(failure.message);
      },
      (data) async* {
        yield WatchlistTvHasData(data);
        },
      );
    }
  }
}
