import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/movie.dart';

import '../../../../movie/test/dummy_data/dummy_objects.dart';

class MockMovieDetailBloc extends MockBloc<MovieDetailEvent, MovieDetailState>
    implements MovieDetailBloc {}
 
class MovieDetailEventFake extends Fake implements MovieDetailEvent {}
class MovieDetailStateFake extends Fake implements MovieDetailState {}

class MockWatchlistStatusMovieBloc extends MockBloc<WatchlistStatusMovieEvent, WatchlistStatusMovieState>
    implements WatchlistStatusMovieBloc {}
 
class WatchlistStatusMovieEventFake extends Fake implements WatchlistStatusMovieEvent {}
class WatchlistStatusMovieStateFake extends Fake implements WatchlistStatusMovieState {}

void main() {
  late MockMovieDetailBloc mockBloc;
  late MockWatchlistStatusMovieBloc watchBloc;

  setUpAll(() {
    registerFallbackValue(MovieDetailEventFake());
    registerFallbackValue(MovieDetailStateFake());
    registerFallbackValue(WatchlistStatusMovieEventFake());
    registerFallbackValue(WatchlistStatusMovieStateFake());
  });

  setUp(() {
    mockBloc = MockMovieDetailBloc();
    watchBloc = MockWatchlistStatusMovieBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieDetailBloc>(
          create: (_) => mockBloc),
        BlocProvider<WatchlistStatusMovieBloc>(
          create: (_) => watchBloc),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  // testWidgets(
  //     'Watchlist button should display add icon when movie not added to watchlist',
  //     (WidgetTester tester) async {
  //   when(() => mockBloc.state).thenReturn(MovieDetailLoading());
  //   when(() => mockBloc.state).thenReturn(MovieDetailHasData(testMovieDetail, testMovieList, false));

  //   final watchlistButtonIcon = find.byIcon(Icons.add);
  //   await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));
  //   await tester.pump(Duration(seconds: 2));

  //   expect(watchlistButtonIcon, findsOneWidget);
  // });

  // testWidgets(
  //     'Watchlist button should dispay check icon when movie is added to wathclist',
  //     (WidgetTester tester) async {
  //   when(() => mockBloc.state).thenReturn(MovieDetailLoading());
  //   when(() => mockBloc.state).thenReturn(MovieDetailHasData(testMovieDetail, testMovieList, true));

  //   final watchlistButtonIcon2 = find.byIcon(Icons.check);
  //   await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));
  //   expect(watchlistButtonIcon2, findsOneWidget);
  // });

  // testWidgets(
  //     'Watchlist button should display Snackbar when added to watchlist',
  //     (WidgetTester tester) async {
  //   // when(mockNotifier.movieState).thenReturn(RequestState.Loaded);
  //   // when(mockNotifier.movie).thenReturn(testMovieDetail);
  //   // when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
  //   // when(mockNotifier.movieRecommendations).thenReturn(<Movie>[]);
  //   // when(mockNotifier.isAddedToWatchlist).thenReturn(false);
  //   // when(mockNotifier.watchlistMessage).thenReturn('Added to Watchlist');
  //   when(() => mockBloc.state).thenReturn(MovieDetailLoading());
  //   when(() => mockBloc.state).thenReturn(MovieDetailHasData(testMovieDetail, testMovieList, false));
  //   // when(() => watchBloc.state).thenReturn(WatchlistStatusMovieLoading());
  //   // when(() => watchBloc.state).thenReturn(WatchlistStatusMovie(false, "Watchlist"));

  //   final watchlistButton = find.byType(ElevatedButton);

  //   await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

  //   expect(find.byIcon(Icons.add), findsOneWidget);

  //   await tester.tap(watchlistButton);
  //   await tester.pump();

  //   expect(find.byType(SnackBar), findsOneWidget);
  //   expect(find.text('Added to Watchlist'), findsOneWidget);
  // });

  // testWidgets(
  //     'Watchlist button should display AlertDialog when add to watchlist failed',
  //     (WidgetTester tester) async {
  //   // when(mockNotifier.movieState).thenReturn(RequestState.Loaded);
  //   // when(mockNotifier.movie).thenReturn(testMovieDetail);
  //   // when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
  //   // when(mockNotifier.movieRecommendations).thenReturn(<Movie>[]);
  //   // when(mockNotifier.isAddedToWatchlist).thenReturn(false);
  //   // when(mockNotifier.watchlistMessage).thenReturn('Failed');

  //   final watchlistButton = find.byType(ElevatedButton);

  //   await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

  //   expect(find.byIcon(Icons.add), findsOneWidget);

  //   await tester.tap(watchlistButton);
  //   await tester.pump();

  //   expect(find.byType(AlertDialog), findsOneWidget);
  //   expect(find.text('Failed'), findsOneWidget);
  // });
}
