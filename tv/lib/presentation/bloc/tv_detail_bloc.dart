import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/entities/tv_detail.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../tv.dart';
 
part 'tv_detail_event.dart';
part 'tv_detail_state.dart';

class TvDetailBloc extends Bloc<TvDetailEvent, TvDetailState> {

  final GetTvDetail _getTvDetail;
  final GetTvRecommendations getTvRecommendations;

  TvDetailBloc(
    this._getTvDetail,
    this.getTvRecommendations,
    ) : super(TvDetailEmpty());

  @override
  Stream<TvDetailState> mapEventToState(
    TvDetailEvent event,
  ) async* {
    if (event is GetTvDetailData) {
      final id = event.id;
  
      yield TvDetailLoading();
      final result = await _getTvDetail.execute(id);
      final recommendationResult = await getTvRecommendations.execute(id);
    
      yield* result.fold(
        (failure) async* {
          yield TvDetailError(failure.message);
        },
        (data) async* {
          yield* recommendationResult.fold(
            (failure) async* {
              yield TvDetailError(failure.message);
            },
            (recomData) async* {
              yield TvDetailHasData(data, recomData);
            }
          );
        },
      );
    }
  }
}
