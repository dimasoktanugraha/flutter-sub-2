part of 'now_tv_bloc.dart';

abstract class NowTvState extends Equatable {
  const NowTvState();
 
  @override
  List<Object> get props => [];
}
 
class NowTvEmpty extends NowTvState {}
 
class NowTvLoading extends NowTvState {}
 
class NowTvError extends NowTvState {
  final String message;
 
  NowTvError(this.message);
 
  @override
  List<Object> get props => [message];
}
 
class NowTvHasData extends NowTvState {
  final List<Tv> result;
 
  NowTvHasData(this.result);
 
  @override
  List<Object> get props => [result];
}