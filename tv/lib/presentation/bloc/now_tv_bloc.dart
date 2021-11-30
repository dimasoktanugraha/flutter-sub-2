import 'package:core/domain/entities/tv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../tv.dart';
 
part 'now_tv_event.dart';
part 'now_tv_state.dart';

class NowTvBloc extends Bloc<NowTvEvent, NowTvState> {
  final GetNowPlayingTvs _getNowTvs;

  NowTvBloc(this._getNowTvs) : super(NowTvEmpty());

  @override
  Stream<NowTvState> mapEventToState(
    NowTvEvent event,
  ) async* {
    if (event is GetNowTvData) {
 
    yield NowTvLoading();
    final result = await _getNowTvs.execute();
 
    yield* result.fold(
      (failure) async* {
        yield NowTvError(failure.message);
      },
      (data) async* {
        yield NowTvHasData(data);
        },
      );
    }
  }
}
