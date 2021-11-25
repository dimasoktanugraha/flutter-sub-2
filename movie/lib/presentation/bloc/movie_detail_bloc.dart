import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/entities/movie_detail.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../movie.dart';
 
part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {

  final GetMovieDetail _getMovieDetail;
  final GetMovieRecommendations getMovieRecommendations;

  MovieDetailBloc(
    this._getMovieDetail,
    this.getMovieRecommendations,
    ) : super(MovieDetailEmpty());


  @override
  Stream<MovieDetailState> mapEventToState(
    MovieDetailEvent event,
  ) async* {
    if (event is GetMovieDetailData) {
      final id = event.id;
  
      yield MovieDetailLoading();
      final result = await _getMovieDetail.execute(id);
      final recommendationResult = await getMovieRecommendations.execute(id);

      yield* result.fold(
        (failure) async* {
          yield MovieDetailError(failure.message);
        },
        (data) async* {
          yield MovieRecommendationLoading();
          yield* recommendationResult.fold(
            (failure) async* {
              yield MovieRecommendationError(failure.message);
            },
            (recomData) async* {
              yield MovieDetailHasData(data, recomData);
            }
          );
        },
      );
    }
  }
}
