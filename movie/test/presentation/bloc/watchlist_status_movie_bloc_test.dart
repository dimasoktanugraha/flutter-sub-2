import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';
import 'package:dartz/dartz.dart';
import '../../dummy_data/dummy_objects.dart';
import 'watchlist_status_movie_bloc_test.mocks.dart';

@GenerateMocks([GetWatchListStatus, SaveWatchlist, RemoveWatchlist])
void main() {
  late WatchlistStatusMovieBloc watchBloc;
  late MockGetWatchListStatus mockGetWatchlistStatus;
  late MockSaveWatchlist mockSaveWatchlist;
  late MockRemoveWatchlist mockRemoveWatchlist;
 
  setUp(() {
    mockGetWatchlistStatus = MockGetWatchListStatus();
    mockSaveWatchlist = MockSaveWatchlist();
    mockRemoveWatchlist = MockRemoveWatchlist();
    watchBloc = WatchlistStatusMovieBloc(mockGetWatchlistStatus, mockSaveWatchlist, mockRemoveWatchlist);
  });

  test('initial state should be empty', () {
    expect(watchBloc.state, WatchlistStatusMovieEmpty());
  });
  
  blocTest<WatchlistStatusMovieBloc, WatchlistStatusMovieState>(
    'Should emit Added Status when data is saved successfully',
    build: () {
      when(mockSaveWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => Right("Added to Watchlist"));
      return watchBloc;
    },
    act: (bloc) => bloc.add(AddMovieWatchlist(testMovieDetail)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistMessageMovie("Added to Watchlist"),
    ],
    verify: (bloc) {
      verify(mockSaveWatchlist.execute(testMovieDetail));
    },
  );

  blocTest<WatchlistStatusMovieBloc, WatchlistStatusMovieState>(
    'Should emit Failed Status when data is saved unsuccessful',
    build: () {
      when(mockSaveWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
      return watchBloc;
    },
    act: (bloc) => bloc.add(AddMovieWatchlist(testMovieDetail)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistStatusMovieError('Failed'),
    ],
    verify: (bloc) {
      verify(mockSaveWatchlist.execute(testMovieDetail));
    },
  );

  blocTest<WatchlistStatusMovieBloc, WatchlistStatusMovieState>(
    'Should emit true when data is on watchlist',
    build: () {
      when(mockGetWatchlistStatus.execute(1))
          .thenAnswer((_) async => true);
      return watchBloc;
    },
    act: (bloc) => bloc.add(IsMovieWatchlisted(1)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistStatusMovieLoading(),
      WatchlistStatusMovie(true),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistStatus.execute(1));
    },
  );

  blocTest<WatchlistStatusMovieBloc, WatchlistStatusMovieState>(
    'Should emit Added Status when data is removed successfully',
    build: () {
      when(mockRemoveWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => Right("Removed from Watchlist"));
      return watchBloc;
    },
    act: (bloc) => bloc.add(RemoveMovieWatchlist(testMovieDetail)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistMessageMovie("Removed from Watchlist"),
    ],
    verify: (bloc) {
      verify(mockRemoveWatchlist.execute(testMovieDetail));
    },
  );

    blocTest<WatchlistStatusMovieBloc, WatchlistStatusMovieState>(
    'Should emit Failed Status when data is saved unsuccessful',
    build: () {
      when(mockRemoveWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
      return watchBloc;
    },
    act: (bloc) => bloc.add(RemoveMovieWatchlist(testMovieDetail)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistStatusMovieError('Failed'),
    ],
    verify: (bloc) {
      verify(mockRemoveWatchlist.execute(testMovieDetail));
    },
  );

  blocTest<WatchlistStatusMovieBloc, WatchlistStatusMovieState>(
    'Should emit true when data is on watchlist',
    build: () {
      when(mockGetWatchlistStatus.execute(1))
          .thenAnswer((_) async => false);
      return watchBloc;
    },
    act: (bloc) => bloc.add(IsMovieWatchlisted(1)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      WatchlistStatusMovieLoading(),
      WatchlistStatusMovie(false),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistStatus.execute(1));
    },
  );
}