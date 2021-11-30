import 'package:core/domain/entities/tv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../tv.dart';
 
part 'top_rated_tv_event.dart';
part 'top_rated_tv_state.dart';

class TopRatedTvBloc extends Bloc<TopRatedTvEvent, TopRatedTvState> {
  final GetTopRatedTvs _getTopRatedTvs;

  TopRatedTvBloc(this._getTopRatedTvs) : super(TopRatedTvEmpty());

  @override
  Stream<TopRatedTvState> mapEventToState(
    TopRatedTvEvent event,
  ) async* {
    if (event is GetTopRatedTvData) {
 
    yield TopRatedTvLoading();
    final result = await _getTopRatedTvs.execute();
 
    yield* result.fold(
      (failure) async* {
        yield TopRatedTvError(failure.message);
      },
      (data) async* {
        yield TopRatedTvHasData(data);
        },
      );
    }
  }
}
