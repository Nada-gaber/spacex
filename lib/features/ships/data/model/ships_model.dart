import 'package:json_annotation/json_annotation.dart';

part 'ships_model.g.dart';

@JsonSerializable()
class Ships {
  final String? image;
  final String? name;
  @JsonKey(name: "year_built")
  final int? yearBuilt;
  @JsonKey(name: "mass_kg")
  final int? massKg;
  final String? type;

  Ships({
    this.image,
    this.name,
    this.yearBuilt,
    this.massKg,
    this.type,
  });
  factory Ships.fromJson(Map<String, dynamic> json) => _$ShipsFromJson(json);
  Map<String, dynamic> toJson() => _$ShipsToJson(this);
}
