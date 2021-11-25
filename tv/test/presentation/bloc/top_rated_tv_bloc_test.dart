import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:tv/presentation/bloc/top_rated_tv_bloc.dart';
import 'package:tv/tv.dart';
import '../../dummy_data/dummy_objects.dart';
import 'top_rated_tv_bloc_test.mocks.dart';

@GenerateMocks([GetTopRatedTvs])
void main() {
  late TopRatedTvBloc topBloc;
  late MockGetTopRatedTvs mockGetTopRatedTvs;
 
  setUp(() {
    mockGetTopRatedTvs = MockGetTopRatedTvs();
    topBloc = TopRatedTvBloc(mockGetTopRatedTvs);
  });

  test('initial state should be empty', () {
    expect(topBloc.state, TopRatedTvEmpty());
  });
  
  blocTest<TopRatedTvBloc, TopRatedTvState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetTopRatedTvs.execute())
          .thenAnswer((_) async => Right(testTvList));
      return topBloc;
    },
    act: (bloc) => bloc.add(GetTopRatedTvData()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      TopRatedTvLoading(),
      TopRatedTvHasData(testTvList),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedTvs.execute());
    },
  );

  blocTest<TopRatedTvBloc, TopRatedTvState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockGetTopRatedTvs.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return topBloc;
    },
    act: (bloc) => bloc.add(GetTopRatedTvData()),
    expect: () => [
      TopRatedTvLoading(),
      TopRatedTvError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTopRatedTvs.execute());
    },
  );
}