import 'package:core/domain/entities/tv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../tv.dart';
 
part 'popular_tv_event.dart';
part 'popular_tv_state.dart';

class PopularTvBloc extends Bloc<PopularTvEvent, PopularTvState> {
  final GetPopularTvs _getPopularTvs;

  PopularTvBloc(this._getPopularTvs) : super(PopularTvEmpty());

  @override
  Stream<PopularTvState> mapEventToState(
    PopularTvEvent event,
  ) async* {
    if (event is GetPopularTvData) {
 
    yield PopularTvLoading();
    final result = await _getPopularTvs.execute();
 
    yield* result.fold(
      (failure) async* {
        yield PopularTvError(failure.message);
      },
      (data) async* {
        yield PopularTvHasData(data);
        },
      );
    }
  }
}
