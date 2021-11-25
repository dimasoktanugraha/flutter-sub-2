import 'package:core/domain/entities/tv.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../search.dart';
 
part 'search_tv_event.dart';
part 'search_tv_state.dart';

class SearchTvBloc extends Bloc<SearchTvEvent, SearchTvState> {
  final SearchTvs _searchTvs;
 
  SearchTvBloc(this._searchTvs) : super(SearchTvEmpty());
 
  @override
  Stream<SearchTvState> mapEventToState(
    SearchTvEvent event,
  ) async* {
    if (event is OnTvQueryChanged) {
      final query = event.query;
  
      yield SearchTvLoading();
      final result = await _searchTvs.execute(query);
  
      yield* result.fold(
        (failure) async* {
          yield SearchTvError(failure.message);
        },
        (data) async* {
          yield SearchTvHasData(data);
        },
      );
    }
  }

  @override
  Stream<Transition<SearchTvEvent, SearchTvState>> transformEvents(
    Stream<SearchTvEvent> events,
    TransitionFunction<SearchTvEvent, SearchTvState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }
}