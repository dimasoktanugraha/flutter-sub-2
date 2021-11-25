part of 'now_movie_bloc.dart';
 
abstract class NowMovieEvent extends Equatable {
  const NowMovieEvent();
 
  @override
  List<Object> get props => [];
}

class GetNowMovieData extends NowMovieEvent {
 
  GetNowMovieData();
 
  @override
  List<Object> get props => [];
}