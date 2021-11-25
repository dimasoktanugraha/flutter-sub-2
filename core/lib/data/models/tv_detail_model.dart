import 'package:core/data/models/created_model.dart';
import 'package:core/data/models/language_model.dart';
import 'package:core/data/models/network_model.dart';
import 'package:core/data/models/season_model.dart';
import 'package:core/domain/entities/tv_detail.dart';
import 'package:equatable/equatable.dart';

import 'genre_model.dart';

class TvDetailResponse extends Equatable{
    TvDetailResponse({
        // required this.backdropPath,
        // required this.createdBy,
        // required this.episodeRunTime,
        // required this.firstAirDate,
        required this.genres,
        // required this.homepage,
        required this.id,
        // required this.inProduction,
        // required this.languages,
        // required this.lastAirDate,
        required this.name,
        // required this.networks,
        // required this.numberOfEpisodes,
        // required this.numberOfSeasons,
        // required this.originCountry,
        // required this.originalLanguage,
        // required this.originalName,
        required this.overview,
        // required this.popularity,
        required this.posterPath,
        // required this.productionCompanies,
        required this.seasons,
        // required this.spokenLanguages,
        // required this.status,
        // required this.tagline,
        // required this.type,
        required this.voteAverage,
        required this.voteCount,
    });

    // final String? backdropPath;
    // final List<CreatedModel> createdBy;
    // final List<int> episodeRunTime;
    // final String firstAirDate;
    final List<GenreModel> genres;
    // final String homepage;
    final int id;
    // final bool inProduction;
    // final List<String> languages;
    // final String lastAirDate;
    final String name;
    // final List<NetworkModel> networks;
    // final int numberOfEpisodes;
    // final int numberOfSeasons;
    // final List<String> originCountry;
    // final String originalLanguage;
    // final String originalName;
    final String overview;
    // final double popularity;
    final String posterPath;
    // final List<NetworkModel> productionCompanies;
    final List<SeasonModel> seasons;
    // final List<LanguageModel> spokenLanguages;
    // final String status;
    // final String tagline;
    // final String type;
    final double voteAverage;
    final int voteCount;

    factory TvDetailResponse.fromJson(Map<String, dynamic> json) => TvDetailResponse(
        // backdropPath: json["backdrop_path"] == null ? "" : json["backdrop_path"],
        // createdBy: List<CreatedModel>.from(json["created_by"].map((x) => CreatedModel.fromJson(x))),
        // episodeRunTime: List<int>.from(json["episode_run_time"].map((x) => x)),
        // firstAirDate: json["first_air_date"],
        genres: List<GenreModel>.from(json["genres"].map((x) => GenreModel.fromJson(x))),
        // homepage: json["homepage"],
        id: json["id"],
        // inProduction: json["in_production"],
        // languages: List<String>.from(json["languages"].map((x) => x)),
        // lastAirDate: json["last_air_date"],
        name: json["name"],
        // networks: List<NetworkModel>.from(json["networks"].map((x) => NetworkModel.fromJson(x))),
        // numberOfEpisodes: json["number_of_episodes"],
        // numberOfSeasons: json["number_of_seasons"],
        // originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        // originalLanguage: json["original_language"],
        // originalName: json["original_name"],
        overview: json["overview"],
        // popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        // productionCompanies: List<NetworkModel>.from(json["production_companies"].map((x) => NetworkModel.fromJson(x))),
        seasons: List<SeasonModel>.from(json["seasons"].map((x) => SeasonModel.fromJson(x))),
        // spokenLanguages: List<LanguageModel>.from(json["spoken_languages"].map((x) => LanguageModel.fromJson(x))),
        // status: json["status"],
        // tagline: json["tagline"],
        // type: json["type"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        // "backdrop_path": backdropPath == null ? "" : backdropPath,
        // "created_by": List<dynamic>.from(createdBy.map((x) => x.toJson())),
        // "episode_run_time": List<dynamic>.from(episodeRunTime.map((x) => x)),
        // "first_air_date": firstAirDate,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        // "homepage": homepage,
        "id": id,
        // "in_production": inProduction,
        // "languages": List<dynamic>.from(languages.map((x) => x)),
        // "last_air_date": lastAirDate,
        "name": name,
        // "networks": List<dynamic>.from(networks.map((x) => x.toJson())),
        // "number_of_episodes": numberOfEpisodes,
        // "number_of_seasons": numberOfSeasons,
        // "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        // "original_language": originalLanguage,
        // "original_name": originalName,
        "overview": overview,
        // "popularity": popularity,
        "poster_path": posterPath,
        // "production_companies": List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
        // "spoken_languages": List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        // "status": status,
        // "tagline": tagline,
        // "type": type,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };

  TvDetail toEntity() {
    return TvDetail(
      // backdropPath: this.backdropPath, 
      // createdBy: this.createdBy.map((created) => created.toEntity()).toList(), 
      // episodeRunTime: this.episodeRunTime, 
      // firstAirDate: this.firstAirDate, 
      genres: this.genres.map((genre) => genre.toEntity()).toList(), 
      // homepage: this.homepage, 
      id: this.id, 
      // inProduction: this.inProduction, 
      // languages: this.languages, 
      // lastAirDate: this.lastAirDate, 
      name: this.name, 
      // networks: this.networks.map((net) => net.toEntity()).toList(), 
      // numberOfEpisodes: this.numberOfEpisodes, 
      // numberOfSeasons: this.numberOfSeasons, 
      // originCountry: this.originCountry, 
      // originalLanguage: this.originalLanguage, 
      // originalName: this.originalName, 
      overview: this.overview, 
      // popularity: this.popularity, 
      posterPath: this.posterPath, 
      // productionCompanies: this.productionCompanies.map((comp) => comp.toEntity()).toList(), 
      seasons: this.seasons.map((ses) => ses.toEntity()).toList(), 
      // spokenLanguages: this.spokenLanguages.map((lang) => lang.toEntity()).toList(), 
      // status: this.status, 
      // tagline: this.tagline, 
      // type: this.type, 
      voteAverage: this.voteAverage, 
      voteCount: this.voteCount);
  }

  @override
  List<Object?> get props => [
      // backdropPath,
      // createdBy,
      // episodeRunTime,
      // firstAirDate,
      genres,
      // homepage,
      id,
      // inProduction,
      // languages,
      // lastAirDate,
      name,
      // networks,
      // numberOfEpisodes,
      // numberOfSeasons,
      // originCountry,
      // originalLanguage,
      // originalName,
      overview,
      // popularity,
      posterPath,
      // productionCompanies,
      seasons,
      // spokenLanguages,
      // status,
      // tagline,
      // type,
      voteAverage,
      voteCount,
    ];
}