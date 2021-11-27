import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv/tv.dart';

import '../../dummy_data/dummy_objects.dart';

class MockTvDetailBloc extends MockBloc<TvDetailEvent, TvDetailState>
    implements TvDetailBloc {}
 
class TvDetailEventFake extends Fake implements TvDetailEvent {}
class TvDetailStateFake extends Fake implements TvDetailState {}

class MockWatchlistStatusTvBloc extends MockBloc<WatchlistStatusTvEvent, WatchlistStatusTvState>
    implements WatchlistStatusTvBloc {}
 
class WatchlistStatusTvEventFake extends Fake implements WatchlistStatusTvEvent {}
class WatchlistStatusTvStateFake extends Fake implements WatchlistStatusTvState {}


void main() {
  late MockTvDetailBloc mockBloc;
  late MockWatchlistStatusTvBloc watchBloc;

  setUpAll(() {
    registerFallbackValue(TvDetailEventFake());
    registerFallbackValue(TvDetailStateFake());
    registerFallbackValue(WatchlistStatusTvEventFake());
    registerFallbackValue(WatchlistStatusTvStateFake());
  });

  setUp(() {
    mockBloc = MockTvDetailBloc();
    watchBloc = MockWatchlistStatusTvBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TvDetailBloc>(
          create: (_) => mockBloc),
        BlocProvider<WatchlistStatusTvBloc>(
          create: (_) => watchBloc),
      ],child: MaterialApp(
        home: body,
      ),
    );
  }

  // testWidgets(
  //     'Watchlist button should display add icon when Tv not added to watchlist',
  //     (WidgetTester tester) async {
  //   when(mockNotifier.tvState).thenReturn(RequestState.Loaded);
  //   when(mockNotifier.tv).thenReturn(testTvDetail);
  //   when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
  //   when(mockNotifier.tvRecommendations).thenReturn(<Tv>[]);
  //   when(mockNotifier.isAddedToWatchlist).thenReturn(false);

  //   final watchlistButtonIcon = find.byIcon(Icons.add);

  //   await tester.pumpWidget(_makeTestableWidget(TvDetailPage(id: 1)));

  //   expect(watchlistButtonIcon, findsOneWidget);
  // });

  // testWidgets(
  //     'Watchlist button should dispay check icon when Tv is added to wathclist',
  //     (WidgetTester tester) async {
  //   when(mockNotifier.tvState).thenReturn(RequestState.Loaded);
  //   when(mockNotifier.tv).thenReturn(testTvDetail);
  //   when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
  //   when(mockNotifier.tvRecommendations).thenReturn(<Tv>[]);
  //   when(mockNotifier.isAddedToWatchlist).thenReturn(true);

  //   final watchlistButtonIcon = find.byIcon(Icons.check);

  //   await tester.pumpWidget(_makeTestableWidget(TvDetailPage(id: 1)));

  //   expect(watchlistButtonIcon, findsOneWidget);
  // });

  // testWidgets(
  //     'Watchlist button should display Snackbar when added to watchlist',
  //     (WidgetTester tester) async {
  //   when(mockNotifier.tvState).thenReturn(RequestState.Loaded);
  //   when(mockNotifier.tv).thenReturn(testTvDetail);
  //   when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
  //   when(mockNotifier.tvRecommendations).thenReturn(<Tv>[]);
  //   when(mockNotifier.isAddedToWatchlist).thenReturn(false);
  //   when(mockNotifier.watchlistMessage).thenReturn('Added to Watchlist Tv');

  //   final watchlistButton = find.byType(ElevatedButton);

  //   await tester.pumpWidget(_makeTestableWidget(TvDetailPage(id: 1)));

  //   expect(find.byIcon(Icons.add), findsOneWidget);

  //   await tester.tap(watchlistButton);
  //   await tester.pump();

  //   expect(find.byType(SnackBar), findsOneWidget);
  //   expect(find.text('Added to Watchlist Tv'), findsOneWidget);
  // });

  // testWidgets(
  //     'Watchlist button should display AlertDialog when add to watchlist failed',
  //     (WidgetTester tester) async {
  //   when(mockNotifier.tvState).thenReturn(RequestState.Loaded);
  //   when(mockNotifier.tv).thenReturn(testTvDetail);
  //   when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
  //   when(mockNotifier.tvRecommendations).thenReturn(<Tv>[]);
  //   when(mockNotifier.isAddedToWatchlist).thenReturn(false);
  //   when(mockNotifier.watchlistMessage).thenReturn('Failed');

  //   final watchlistButton = find.byType(ElevatedButton);

  //   await tester.pumpWidget(_makeTestableWidget(TvDetailPage(id: 1)));

  //   expect(find.byIcon(Icons.add), findsOneWidget);

  //   await tester.tap(watchlistButton);
  //   await tester.pump();

  //   expect(find.byType(AlertDialog), findsOneWidget);
  //   expect(find.text('Failed'), findsOneWidget);
  // });
}
