part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();
 
  @override
  List<Object> get props => [];
}
 
class MovieDetailEmpty extends MovieDetailState {}
 
class MovieDetailLoading extends MovieDetailState {}
 
class MovieDetailError extends MovieDetailState {
  final String message;
 
  MovieDetailError(this.message);
 
  @override
  List<Object> get props => [message];
}

class MovieRecommendationEmpty extends MovieDetailState {}
 
class MovieRecommendationLoading extends MovieDetailState {}

class MovieRecommendationError extends MovieDetailState {
  final String message;
 
  MovieRecommendationError(this.message);
 
  @override
  List<Object> get props => [message];
}
 
class MovieDetailHasData extends MovieDetailState {
  final MovieDetail result;
  final List<Movie> recommendation;

  MovieDetailHasData(this.result, this.recommendation);
 
  @override
  List<Object> get props => [result, recommendation];
}