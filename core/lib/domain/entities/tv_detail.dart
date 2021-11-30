import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/season.dart';
import 'package:equatable/equatable.dart';

class TvDetail extends Equatable{
    TvDetail({
        required this.genres,
        required this.id,
        required this.name,
        required this.overview,
        required this.posterPath,
        required this.seasons,
        required this.voteAverage,
        required this.voteCount,
    });

    final List<Genre> genres;
    final int id;
    final String name;
    final String overview;
    final String posterPath;
    final List<Season> seasons;
    final double voteAverage;
    final int voteCount;

  @override
  List<Object?> get props => [
      genres,
      id,
      name,
      overview,
      posterPath,
      seasons,
      voteAverage,
      voteCount,
    ];
}