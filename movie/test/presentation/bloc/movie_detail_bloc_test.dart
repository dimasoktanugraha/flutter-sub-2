import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:movie/presentation/bloc/movie_detail_bloc.dart';
import '../../dummy_data/dummy_objects.dart';
import 'movie_detail_bloc_test.mocks.dart';

@GenerateMocks([  
  GetMovieDetail,
  GetMovieRecommendations,
  GetWatchListStatus
  ])
void main() {
  late MovieDetailBloc detailBloc;

  late MockGetMovieDetail mockGetMovieDetail;
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MockGetWatchListStatus mockGetWatchListStatus;
 
  setUp(() {
    // listenerCallCount = 0;
    mockGetMovieDetail = MockGetMovieDetail();
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    mockGetWatchListStatus = MockGetWatchListStatus();
    detailBloc = MovieDetailBloc(
      mockGetMovieDetail,
      mockGetMovieRecommendations,
      mockGetWatchListStatus
    );
  });

  test('initial state should be empty', () {
    expect(detailBloc.state, MovieDetailEmpty());
  });

  final id = 1;
  
  blocTest<MovieDetailBloc, MovieDetailState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetMovieDetail.execute(id))
          .thenAnswer((_) async => Right(testMovieDetail));
      when(mockGetMovieRecommendations.execute(id))
          .thenAnswer((_) async => Right(testMovieList));
      when(mockGetWatchListStatus.execute(id))
          .thenAnswer((_) async => false);
      return detailBloc;
    },
    act: (bloc) {
      bloc.add(GetMovieDetailData(id));
    },
    wait: const Duration(milliseconds: 100),
    expect: () => [
      MovieDetailLoading(),
      MovieRecommendationLoading(),
      MovieDetailHasData(testMovieDetail, testMovieList, false),
    ],
    verify: (bloc) {
      verify(mockGetMovieDetail.execute(id));
      verify(mockGetMovieRecommendations.execute(id));
      verify(mockGetWatchListStatus.execute(id));       
    },
  );

  blocTest<MovieDetailBloc, MovieDetailState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockGetMovieDetail.execute(id))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(mockGetMovieRecommendations.execute(id))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(mockGetWatchListStatus.execute(id))
          .thenAnswer((_) async => false);
      return detailBloc;
    },
    act: (bloc) => bloc.add(GetMovieDetailData(id)),
    expect: () => [
      MovieDetailLoading(),
      MovieDetailError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetMovieDetail.execute(id));
      verify(mockGetMovieRecommendations.execute(id));
      verify(mockGetWatchListStatus.execute(id));     
    },
  );

  
}