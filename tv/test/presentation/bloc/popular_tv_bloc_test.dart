import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:tv/presentation/bloc/popular_tv_bloc.dart';
import 'package:tv/tv.dart';
import '../../dummy_data/dummy_objects.dart';
import 'popular_tv_bloc_test.mocks.dart';

@GenerateMocks([GetPopularTvs])
void main() {
  late PopularTvBloc popularBloc;
  late MockGetPopularTvs mockGetPopularTvs;
 
  setUp(() {
    mockGetPopularTvs = MockGetPopularTvs();
    popularBloc = PopularTvBloc(mockGetPopularTvs);
  });

  test('initial state should be empty', () {
    expect(popularBloc.state, PopularTvEmpty());
  });

  
  blocTest<PopularTvBloc, PopularTvState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetPopularTvs.execute())
          .thenAnswer((_) async => Right(testTvList));
      return popularBloc;
    },
    act: (bloc) => bloc.add(GetPopularTvData()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      PopularTvLoading(),
      PopularTvHasData(testTvList),
    ],
    verify: (bloc) {
      verify(mockGetPopularTvs.execute());
    },
  );

  blocTest<PopularTvBloc, PopularTvState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockGetPopularTvs.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return popularBloc;
    },
    act: (bloc) => bloc.add(GetPopularTvData()),
    expect: () => [
      PopularTvLoading(),
      PopularTvError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetPopularTvs.execute());
    },
  );
}