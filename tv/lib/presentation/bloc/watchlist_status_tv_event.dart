part of 'watchlist_status_tv_bloc.dart';
 
abstract class WatchlistStatusTvEvent extends Equatable {
  const WatchlistStatusTvEvent();
 
  @override
  List<Object> get props => [];
}

class IsTvWatchlisted extends WatchlistStatusTvEvent {
  final int id;

  IsTvWatchlisted(this.id);
 
  @override
  List<Object> get props => [id];
}

class AddTvWatchlist extends WatchlistStatusTvEvent {
  final TvDetail tv;

  AddTvWatchlist(this.tv);
 
  @override
  List<Object> get props => [tv];
}

class RemoveTvWatchlist extends WatchlistStatusTvEvent {
  final TvDetail tv;

  RemoveTvWatchlist(this.tv);
 
  @override
  List<Object> get props => [tv];
}
