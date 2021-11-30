part of 'watchlist_status_tv_bloc.dart';

abstract class WatchlistStatusTvState extends Equatable {
  const WatchlistStatusTvState();
 
  @override
  List<Object> get props => [];
}
 
class WatchlistStatusTvEmpty extends WatchlistStatusTvState {}
 
class WatchlistStatusTvLoading extends WatchlistStatusTvState {}
 
class WatchlistStatusTvError extends WatchlistStatusTvState {
  final String message;
 
  WatchlistStatusTvError(this.message);
 
  @override
  List<Object> get props => [message];
}
 
class WatchlistStatusTv extends WatchlistStatusTvState {
  final bool isWatchlisted;
 
  WatchlistStatusTv(this.isWatchlisted);
 
  @override
  List<Object> get props => [isWatchlisted];
}

class WatchlistMessageTv extends WatchlistStatusTvState {
  final String message;
 
  WatchlistMessageTv(this.message);
 
  @override
  List<Object> get props => [message];
}