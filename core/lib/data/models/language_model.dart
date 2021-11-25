import 'package:core/domain/entities/language.dart';
import 'package:equatable/equatable.dart';

class LanguageModel extends Equatable {
    LanguageModel({
        required this.englishName,
        required this.iso6391,
        required this.name,
    });

    final String englishName;
    final String iso6391;
    final String name;

    factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
    };

    Language toEntity() {
      return Language(
        englishName: this.englishName,
        iso6391: this.iso6391,
        name: this.name);
    }


    @override
    List<Object> get props => [
        englishName,
        iso6391,
        name
      ];
}
