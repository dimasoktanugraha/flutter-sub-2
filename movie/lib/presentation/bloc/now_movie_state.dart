part of 'now_movie_bloc.dart';

abstract class NowMovieState extends Equatable {
  const NowMovieState();
 
  @override
  List<Object> get props => [];
}
 
class NowMovieEmpty extends NowMovieState {}
 
class NowMovieLoading extends NowMovieState {}
 
class NowMovieError extends NowMovieState {
  final String message;
 
  NowMovieError(this.message);
 
  @override
  List<Object> get props => [message];
}
 
class NowMovieHasData extends NowMovieState {
  final List<Movie> result;
 
  NowMovieHasData(this.result);
 
  @override
  List<Object> get props => [result];
}