part of 'watchlist_status_movie_bloc.dart';
 
abstract class WatchlistStatusMovieEvent extends Equatable {
  const WatchlistStatusMovieEvent();
 
  @override
  List<Object> get props => [];
}

class IsMovieWatchlisted extends WatchlistStatusMovieEvent {
  final int id;

  IsMovieWatchlisted(this.id);
 
  @override
  List<Object> get props => [id];
}

class AddMovieWatchlist extends WatchlistStatusMovieEvent {
  final MovieDetail movie;

  AddMovieWatchlist(this.movie);
 
  @override
  List<Object> get props => [movie];
}

class RemoveMovieWatchlist extends WatchlistStatusMovieEvent {
  final MovieDetail movie;

  RemoveMovieWatchlist(this.movie);
 
  @override
  List<Object> get props => [movie];
}
