import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:tv/presentation/bloc/tv_detail_bloc.dart';
import 'package:tv/tv.dart';
import '../../dummy_data/dummy_objects.dart';
import 'tv_detail_bloc_test.mocks.dart';

@GenerateMocks([  
  GetTvDetail,
  GetTvRecommendations,
  ])
void main() {
  late TvDetailBloc detailBloc;

  late MockGetTvDetail mockGetTvDetail;
  late MockGetTvRecommendations mockGetTvRecommendations;
 
  setUp(() {
    mockGetTvDetail = MockGetTvDetail();
    mockGetTvRecommendations = MockGetTvRecommendations();
    detailBloc = TvDetailBloc(
      mockGetTvDetail,
      mockGetTvRecommendations,
    );
  });

  test('initial state should be empty', () {
    expect(detailBloc.state, TvDetailEmpty());
  });

  final id = 1;
  
  blocTest<TvDetailBloc, TvDetailState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetTvDetail.execute(id))
          .thenAnswer((_) async => Right(testTvDetail));
      when(mockGetTvRecommendations.execute(id))
          .thenAnswer((_) async => Right(testTvList));
      return detailBloc;
    },
    act: (bloc) {
      bloc.add(GetTvDetailData(id));
    },
    wait: const Duration(milliseconds: 100),
    expect: () => [
      TvDetailLoading(),
      TvRecommendationLoading(),
      TvDetailHasData(testTvDetail, testTvList),
    ],
    verify: (bloc) {
      verify(mockGetTvDetail.execute(id));
      verify(mockGetTvRecommendations.execute(id));      
    },
  );

  blocTest<TvDetailBloc, TvDetailState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockGetTvDetail.execute(id))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(mockGetTvRecommendations.execute(id))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return detailBloc;
    },
    act: (bloc) => bloc.add(GetTvDetailData(id)),
    expect: () => [
      TvDetailLoading(),
      TvDetailError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTvDetail.execute(id));
      verify(mockGetTvRecommendations.execute(id));
    },
  );

  
}