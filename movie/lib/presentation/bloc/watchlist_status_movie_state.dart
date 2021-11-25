part of 'watchlist_status_movie_bloc.dart';

abstract class WatchlistStatusMovieState extends Equatable {
  const WatchlistStatusMovieState();
 
  @override
  List<Object> get props => [];
}
 
class WatchlistStatusMovieEmpty extends WatchlistStatusMovieState {}
 
class WatchlistStatusMovieLoading extends WatchlistStatusMovieState {}
 
class WatchlistStatusMovieError extends WatchlistStatusMovieState {
  final String message;
 
  WatchlistStatusMovieError(this.message);
 
  @override
  List<Object> get props => [message];
}
 
class WatchlistStatusMovie extends WatchlistStatusMovieState {
  final bool isWatchlisted;
 
  WatchlistStatusMovie(this.isWatchlisted);
 
  @override
  List<Object> get props => [isWatchlisted];
}

class WatchlistMessageMovie extends WatchlistStatusMovieState {
  final String message;
 
  WatchlistMessageMovie(this.message);
 
  @override
  List<Object> get props => [message];
}