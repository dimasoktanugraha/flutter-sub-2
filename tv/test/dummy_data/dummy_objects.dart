import 'package:core/data/models/tv_table.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/season.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/entities/tv_detail.dart';



final testTv = Tv(
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  popularity: 10.991,
  id: 998,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  voteAverage: 8.2,
  overview: 'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  firstAirDate: '2002-05-01',
  originCountry: ["US"],
  genreIds: [14, 28],
  originalLanguage: "en",
  voteCount: 13507,
  name: "Game of Thrones",
  originalName: "Game of Thrones",
);

final testTvList = [testTv];

final testTvDetail = TvDetail(
  genres: [Genre(id: 10765, name: '"Sci-Fi & Fantasy"')],
  id: 1399, 
  name: "Game of Thrones", 
  overview: "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.", 
  posterPath: "/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg", 
  seasons: [Season(airDate: "2010-12-05", episodeCount: 64, id: 3627, name: "Specials", overview: "", posterPath: "/kMTcwNRfFKCZ0O2OaBZS0nZ2AIe.jpg", seasonNumber: 0)], 
  voteAverage: 8.3, 
  voteCount: 11504
);

final testWatchlistTv = Tv.watchlist(
  id: 1399,
  name: 'Game of Thrones',
  posterPath: '/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg',
  overview: "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.", 
);

final testTvTable = TvTable(
  id: 1399,
  title: 'Game of Thrones',
  posterPath: '/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg',
  overview: "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.", 
);

final testTvMap = {
  'id': 1399,
  'overview': "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.", 
  'posterPath': '/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg',
  'title': 'Game of Thrones',
};