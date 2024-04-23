import 'package:json_annotation/json_annotation.dart';

part 'rocket_model.g.dart';

@JsonSerializable()
class Rocket {
  String? name;
  String? type;
  double? height;
  double? mass;
  int? costPerLaunch;
  String? firstFlight;
  String? country;
  String? company;
  String? wikipedia;
  String? description;
  String? id;
  List<String>? flickrImages;

  Rocket(
      {this.height,
      this.mass,
      this.flickrImages,
      this.name,
      this.type,
      this.costPerLaunch,
      this.firstFlight,
      this.country,
      this.company,
      this.wikipedia,
      this.description,
      this.id});

  factory Rocket.fromJson(Map<String, dynamic> json) => _$RocketFromJson(json);

  Map<String, dynamic> toJson() => _$RocketToJson(this);
}
