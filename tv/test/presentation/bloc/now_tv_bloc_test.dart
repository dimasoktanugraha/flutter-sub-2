import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:tv/presentation/bloc/now_tv_bloc.dart';
import 'package:tv/tv.dart';
import '../../dummy_data/dummy_objects.dart';
import 'now_tv_bloc_test.mocks.dart';

@GenerateMocks([GetNowPlayingTvs])
void main() {
  late NowTvBloc nowBloc;
  late MockGetNowPlayingTvs mockGetNowTvs;
 
  setUp(() {
    mockGetNowTvs = MockGetNowPlayingTvs();
    nowBloc = NowTvBloc(mockGetNowTvs);
  });

  test('initial state should be empty', () {
    expect(nowBloc.state, NowTvEmpty());
  });
  
  blocTest<NowTvBloc, NowTvState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetNowTvs.execute())
          .thenAnswer((_) async => Right(testTvList));
      return nowBloc;
    },
    act: (bloc) => bloc.add(GetNowTvData()),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      NowTvLoading(),
      NowTvHasData(testTvList),
    ],
    verify: (bloc) {
      verify(mockGetNowTvs.execute());
    },
  );

  blocTest<NowTvBloc, NowTvState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockGetNowTvs.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return nowBloc;
    },
    act: (bloc) => bloc.add(GetNowTvData()),
    expect: () => [
      NowTvLoading(),
      NowTvError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowTvs.execute());
    },
  );
}