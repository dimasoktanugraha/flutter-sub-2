// Mocks generated by Mockito 5.0.15 from annotations
// in tv/test/presentation/pages/tv_detail_page_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;
import 'dart:ui' as _i7;

import 'package:core/domain/entities/tv.dart' as _i5;
import 'package:core/domain/entities/tv_detail.dart' as _i3;
import 'package:core/utils/state_enum.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tv/tv.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeGetTvDetail_0 extends _i1.Fake implements _i2.GetTvDetail {}

class _FakeGetTvRecommendations_1 extends _i1.Fake
    implements _i2.GetTvRecommendations {}

class _FakeGetWatchListStatusTv_2 extends _i1.Fake
    implements _i2.GetWatchListStatusTv {}

class _FakeSaveWatchlistTv_3 extends _i1.Fake implements _i2.SaveWatchlistTv {}

class _FakeRemoveWatchlistTv_4 extends _i1.Fake
    implements _i2.RemoveWatchlistTv {}

class _FakeTvDetail_5 extends _i1.Fake implements _i3.TvDetail {}

/// A class which mocks [TvDetailNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvDetailNotifier extends _i1.Mock implements _i2.TvDetailNotifier {
  MockTvDetailNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetTvDetail get getTvDetail =>
      (super.noSuchMethod(Invocation.getter(#getTvDetail),
          returnValue: _FakeGetTvDetail_0()) as _i2.GetTvDetail);
  @override
  _i2.GetTvRecommendations get getTvRecommendations => (super.noSuchMethod(
      Invocation.getter(#getTvRecommendations),
      returnValue: _FakeGetTvRecommendations_1()) as _i2.GetTvRecommendations);
  @override
  _i2.GetWatchListStatusTv get getWatchListStatusTv => (super.noSuchMethod(
      Invocation.getter(#getWatchListStatusTv),
      returnValue: _FakeGetWatchListStatusTv_2()) as _i2.GetWatchListStatusTv);
  @override
  _i2.SaveWatchlistTv get saveWatchlistTv =>
      (super.noSuchMethod(Invocation.getter(#saveWatchlistTv),
          returnValue: _FakeSaveWatchlistTv_3()) as _i2.SaveWatchlistTv);
  @override
  _i2.RemoveWatchlistTv get removeWatchlistTv =>
      (super.noSuchMethod(Invocation.getter(#removeWatchlistTv),
          returnValue: _FakeRemoveWatchlistTv_4()) as _i2.RemoveWatchlistTv);
  @override
  _i3.TvDetail get tv => (super.noSuchMethod(Invocation.getter(#tv),
      returnValue: _FakeTvDetail_5()) as _i3.TvDetail);
  @override
  _i4.RequestState get tvState =>
      (super.noSuchMethod(Invocation.getter(#tvState),
          returnValue: _i4.RequestState.Empty) as _i4.RequestState);
  @override
  List<_i5.Tv> get tvRecommendations =>
      (super.noSuchMethod(Invocation.getter(#tvRecommendations),
          returnValue: <_i5.Tv>[]) as List<_i5.Tv>);
  @override
  _i4.RequestState get recommendationState =>
      (super.noSuchMethod(Invocation.getter(#recommendationState),
          returnValue: _i4.RequestState.Empty) as _i4.RequestState);
  @override
  String get message =>
      (super.noSuchMethod(Invocation.getter(#message), returnValue: '')
          as String);
  @override
  bool get isAddedToWatchlist =>
      (super.noSuchMethod(Invocation.getter(#isAddedToWatchlist),
          returnValue: false) as bool);
  @override
  String get watchlistMessage =>
      (super.noSuchMethod(Invocation.getter(#watchlistMessage), returnValue: '')
          as String);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i6.Future<void> fetchTvDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#fetchTvDetail, [id]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> addWatchlistTv(_i3.TvDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#addWatchlistTv, [tv]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> removeFromWatchlistTv(_i3.TvDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#removeFromWatchlistTv, [tv]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> loadWatchlistStatusTv(int? id) =>
      (super.noSuchMethod(Invocation.method(#loadWatchlistStatusTv, [id]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  void addListener(_i7.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i7.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}
