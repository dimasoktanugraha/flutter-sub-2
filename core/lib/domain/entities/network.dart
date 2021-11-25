import 'package:equatable/equatable.dart';

class Network extends Equatable {
    Network({
        required this.name,
        required this.id,
        required this.logoPath,
        required this.originCountry,
    });

    final String name;
    final int id;
    final String logoPath;
    final String originCountry;

    factory Network.fromJson(Map<String, dynamic> json) => Network(
        name: json["name"],
        id: json["id"],
        logoPath: json["logo_path"] == null ? null : json["logo_path"],
        originCountry: json["origin_country"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "logo_path": logoPath == null ? null : logoPath,
        "origin_country": originCountry,
    };

    @override
    List<Object> get props => [
        name, 
        id,
        logoPath,
        originCountry
      ];
}