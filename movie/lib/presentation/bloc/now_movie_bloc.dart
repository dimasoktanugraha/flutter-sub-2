import 'package:core/domain/entities/movie.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../movie.dart';
 
part 'now_movie_event.dart';
part 'now_movie_state.dart';

class NowMovieBloc extends Bloc<NowMovieEvent, NowMovieState> {
  final GetNowPlayingMovies _getNowMovies;

  NowMovieBloc(this._getNowMovies) : super(NowMovieEmpty());

  @override
  Stream<NowMovieState> mapEventToState(
    NowMovieEvent event,
  ) async* {
    if (event is GetNowMovieData) {
 
    yield NowMovieLoading();
    final result = await _getNowMovies.execute();
 
    yield* result.fold(
      (failure) async* {
        yield NowMovieError(failure.message);
      },
      (data) async* {
        yield NowMovieHasData(data);
        },
      );
    }
  }
}
