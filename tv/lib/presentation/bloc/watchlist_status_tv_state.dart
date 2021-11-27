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
  final String message;
 
  WatchlistStatusTv(this.isWatchlisted, this.message);
 
  @override
  List<Object> get props => [isWatchlisted, message];
}