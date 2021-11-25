import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:tv/presentation/bloc/watchlist_tv_bloc.dart';
import 'package:tv/tv.dart';
import '../../dummy_data/dummy_objects.dart';
import 'watchlist_tv_bloc_test.mocks.dart';

@GenerateMocks([GetWatchlistTvs])
void main() {
  late WatchlistTvBloc watchBloc;
  late MockGetWatchlistTvs mockGetWatchlistTvs;
 
  setUp(() {
    mockGetWatchlistTvs = MockGetWatchlistTvs();
    watchBloc = WatchlistTvBloc(mockGetWatchlistTvs);
  });

  test('initial state should be empty', () {
    expect(watchBloc.state, WatchlistTvEmpty());
  });
  
  blocTest<WatchlistTvBloc, WatchlistTvState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetWatchlistTvs.execute())
          .thenAnswer((_) async => Right(testTvList));
      return watchBloc;
    },
    act: (bloc) => bloc.add(GetWatchlistTvData()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistTvLoading(),
      WatchlistTvHasData(testTvList),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistTvs.execute());
    },
  );

  blocTest<WatchlistTvBloc, WatchlistTvState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockGetWatchlistTvs.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return watchBloc;
    },
    act: (bloc) => bloc.add(GetWatchlistTvData()),
    expect: () => [
      WatchlistTvLoading(),
      WatchlistTvError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistTvs.execute());
    },
  );
}