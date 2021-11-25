import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';
import 'package:dartz/dartz.dart';
import '../../dummy_data/dummy_objects.dart';
import 'now_movie_bloc_test.mocks.dart';

@GenerateMocks([GetNowPlayingMovies])
void main() {
  late NowMovieBloc nowBloc;
  late MockGetNowPlayingMovies mockGetNowMovies;
 
  setUp(() {
    mockGetNowMovies = MockGetNowPlayingMovies();
    nowBloc = NowMovieBloc(mockGetNowMovies);
  });

  test('initial state should be empty', () {
    expect(nowBloc.state, NowMovieEmpty());
  });
  
  blocTest<NowMovieBloc, NowMovieState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetNowMovies.execute())
          .thenAnswer((_) async => Right(testMovieList));
      return nowBloc;
    },
    act: (bloc) => bloc.add(GetNowMovieData()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      NowMovieLoading(),
      NowMovieHasData(testMovieList),
    ],
    verify: (bloc) {
      verify(mockGetNowMovies.execute());
    },
  );

  blocTest<NowMovieBloc, NowMovieState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockGetNowMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return nowBloc;
    },
    act: (bloc) => bloc.add(GetNowMovieData()),
    expect: () => [
      NowMovieLoading(),
      NowMovieError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowMovies.execute());
    },
  );
}