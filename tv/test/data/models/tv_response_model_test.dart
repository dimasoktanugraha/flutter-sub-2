import 'dart:convert';

import 'package:core/data/models/tv_model.dart';
import 'package:core/data/models/tv_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

void main() {
  final tTvModel = TvModel(
    posterPath: "/zra8NrzxaEeunRWJmUm3HZOL4sd.jpg",
    popularity: 11.520271,
    id: 67419,
    backdropPath: "/b0BckgEovxYLBbIk5xXyWYQpmlT.jpg",
    voteAverage: 1.39,
    overview: "The early life of Queen Victoria, from her accession to the throne at the tender age of 18 through to her courtship and marriage to Prince Albert. Victoria went on to rule for 63 years, and was the longest-serving monarch until she was overtaken by Elizabeth II on 9th September 2016. Rufus Sewell was Victoria’s first prime minister; the two immediately connected and their intimate friendship became a popular source of gossip that threatened to destabilise the Government – angering both Tory and Whigs alike.",
    firstAirDate: "2016-08-28",
    originCountry: ["GB"],
    genreIds: [18],
    originalLanguage: "en",
    voteCount: 9,
    name: "Victoria",
    originalName: "Victoria",
  );

  final tTvResponseModel =
      TvResponse(tvList: <TvModel>[tTvModel]);

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/now_playing_tv.json'));
      // act
      final result = TvResponse.fromJson(jsonMap);
      // assert
      expect(result, tTvResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tTvResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "results": [
          {
            "poster_path": "/zra8NrzxaEeunRWJmUm3HZOL4sd.jpg",
            "popularity": 11.520271,
            "id": 67419,
            "backdrop_path": "/b0BckgEovxYLBbIk5xXyWYQpmlT.jpg",
            "vote_average": 1.39,
            "overview": "The early life of Queen Victoria, from her accession to the throne at the tender age of 18 through to her courtship and marriage to Prince Albert. Victoria went on to rule for 63 years, and was the longest-serving monarch until she was overtaken by Elizabeth II on 9th September 2016. Rufus Sewell was Victoria’s first prime minister; the two immediately connected and their intimate friendship became a popular source of gossip that threatened to destabilise the Government – angering both Tory and Whigs alike.",
            "first_air_date": "2016-08-28",
            "origin_country": [
              "GB"
            ],
            "genre_ids": [
              18
            ],
            "original_language": "en",
            "vote_count": 9,
            "name": "Victoria",
            "original_name": "Victoria"
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
