import 'package:core/data/models/season_model.dart';
import 'package:core/domain/entities/tv_detail.dart';
import 'package:equatable/equatable.dart';

import 'genre_model.dart';

class TvDetailResponse extends Equatable{
    TvDetailResponse({
        required this.genres,
        required this.id,
        required this.name,
        required this.overview,
        required this.posterPath,
        required this.seasons,
        required this.voteAverage,
        required this.voteCount,
    });

    final List<GenreModel> genres;
    final int id;
    final String name;
    final String overview;
    final String posterPath;
    final List<SeasonModel> seasons;
    final double voteAverage;
    final int voteCount;

    factory TvDetailResponse.fromJson(Map<String, dynamic> json) => TvDetailResponse(
        genres: List<GenreModel>.from(json["genres"].map((x) => GenreModel.fromJson(x))),
        id: json["id"],
        name: json["name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        seasons: List<SeasonModel>.from(json["seasons"].map((x) => SeasonModel.fromJson(x))),
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "id": id,
        "name": name,
        "overview": overview,
        "poster_path": posterPath,
        "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };

  TvDetail toEntity() {
    return TvDetail(
      genres: this.genres.map((genre) => genre.toEntity()).toList(), 
      id: this.id, 
      name: this.name, 
      overview: this.overview, 
      posterPath: this.posterPath, 
      seasons: this.seasons.map((ses) => ses.toEntity()).toList(), 
      voteAverage: this.voteAverage, 
      voteCount: this.voteCount);
  }

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