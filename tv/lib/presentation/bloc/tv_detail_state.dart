part of 'tv_detail_bloc.dart';

abstract class TvDetailState extends Equatable {
  const TvDetailState();
 
  @override
  List<Object> get props => [];
}
 
class TvDetailEmpty extends TvDetailState {}
 
class TvDetailLoading extends TvDetailState {}
 
class TvDetailError extends TvDetailState {
  final String message;
 
  TvDetailError(this.message);
 
  @override
  List<Object> get props => [message];
}

class TvRecommendationEmpty extends TvDetailState {}
 
class TvRecommendationLoading extends TvDetailState {}

class TvRecommendationError extends TvDetailState {
  final String message;
 
  TvRecommendationError(this.message);
 
  @override
  List<Object> get props => [message];
}
 
class TvDetailHasData extends TvDetailState {
  final TvDetail result;
  final List<Tv> recommendation;

  TvDetailHasData(this.result, this.recommendation);
 
  @override
  List<Object> get props => [result, recommendation];
}