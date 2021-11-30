import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv/tv.dart';
import 'package:dartz/dartz.dart';
import '../../dummy_data/dummy_objects.dart';
import 'watchlist_status_tv_bloc_test.mocks.dart';

@GenerateMocks([GetWatchListStatusTv, SaveWatchlistTv, RemoveWatchlistTv])
void main() {
  late WatchlistStatusTvBloc watchBloc;
  late MockGetWatchListStatusTv mockGetWatchlistStatus;
  late MockSaveWatchlistTv mockSaveWatchlist;
  late MockRemoveWatchlistTv mockRemoveWatchlist;
 
  setUp(() {
    mockGetWatchlistStatus = MockGetWatchListStatusTv();
    mockSaveWatchlist = MockSaveWatchlistTv();
    mockRemoveWatchlist = MockRemoveWatchlistTv();
    watchBloc = WatchlistStatusTvBloc(mockGetWatchlistStatus, mockSaveWatchlist, mockRemoveWatchlist);
  });

  test('initial state should be empty', () {
    expect(watchBloc.state, WatchlistStatusTvEmpty());
  });
  
  blocTest<WatchlistStatusTvBloc, WatchlistStatusTvState>(
    'Should emit Added Status when data is saved successfully',
    build: () {
      when(mockSaveWatchlist.execute(testTvDetail))
          .thenAnswer((_) async => Right("Added to Watchlist Tv"));
      return watchBloc;
    },
    act: (bloc) => bloc.add(AddTvWatchlist(testTvDetail)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistMessageTv("Added to Watchlist Tv"),
    ],
    verify: (bloc) {
      verify(mockSaveWatchlist.execute(testTvDetail));
    },
  );

  blocTest<WatchlistStatusTvBloc, WatchlistStatusTvState>(
    'Should emit Failed Status when data is saved unsuccessful',
    build: () {
      when(mockSaveWatchlist.execute(testTvDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
      return watchBloc;
    },
    act: (bloc) => bloc.add(AddTvWatchlist(testTvDetail)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistStatusTvError('Failed'),
    ],
    verify: (bloc) {
      verify(mockSaveWatchlist.execute(testTvDetail));
    },
  );

  blocTest<WatchlistStatusTvBloc, WatchlistStatusTvState>(
    'Should emit true when data is on watchlist',
    build: () {
      when(mockGetWatchlistStatus.execute(1))
          .thenAnswer((_) async => true);
      return watchBloc;
    },
    act: (bloc) => bloc.add(IsTvWatchlisted(1)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistStatusTvLoading(),
      WatchlistStatusTv(true),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistStatus.execute(1));
    },
  );

  blocTest<WatchlistStatusTvBloc, WatchlistStatusTvState>(
    'Should emit Added Status when data is removed successfully',
    build: () {
      when(mockRemoveWatchlist.execute(testTvDetail))
          .thenAnswer((_) async => Right("Removed from Watchlist Tv"));
      return watchBloc;
    },
    act: (bloc) => bloc.add(RemoveTvWatchlist(testTvDetail)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistMessageTv("Removed from Watchlist Tv"),
    ],
    verify: (bloc) {
      verify(mockRemoveWatchlist.execute(testTvDetail));
    },
  );

    blocTest<WatchlistStatusTvBloc, WatchlistStatusTvState>(
    'Should emit Failed Status when data is saved unsuccessful',
    build: () {
      when(mockRemoveWatchlist.execute(testTvDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
      return watchBloc;
    },
    act: (bloc) => bloc.add(RemoveTvWatchlist(testTvDetail)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistStatusTvError('Failed'),
    ],
    verify: (bloc) {
      verify(mockRemoveWatchlist.execute(testTvDetail));
    },
  );

  blocTest<WatchlistStatusTvBloc, WatchlistStatusTvState>(
    'Should emit true when data is on watchlist',
    build: () {
      when(mockGetWatchlistStatus.execute(1))
          .thenAnswer((_) async => false);
      return watchBloc;
    },
    act: (bloc) => bloc.add(IsTvWatchlisted(1)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistStatusTvLoading(),
      WatchlistStatusTv(false),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistStatus.execute(1));
    },
  );
}