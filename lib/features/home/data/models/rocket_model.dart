import 'package:json_annotation/json_annotation.dart';

part 'rocket_model.g.dart';

@JsonSerializable()
class Rocket {
  Diameter? height;
  Mass? mass;
  @JsonKey(name:"flickr_images")
  List<String>? flickrImages;
  String? name;
  String? type;
  bool? active;
  @JsonKey(name:"cost_per_launch")
  int? costPerLaunch;
  @JsonKey(name:"first_flight")
  String? firstFlight;
  String? country;
  String? company;
  String? wikipedia;
  String? description;
  String? id;

  Rocket(
      {this.height,
      this.mass,
      this.flickrImages,
      this.name,
      this.type,
      this.active,
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

@JsonSerializable()
class Diameter {
  double? meters;
  double? feet;

  Diameter({this.meters, this.feet});

  factory Diameter.fromJson(Map<String, dynamic> json) =>
      _$DiameterFromJson(json);

  Map<String, dynamic> toJson() => _$DiameterToJson(this);
}

@JsonSerializable()
class Mass {
  int? kg;
  int? lb;

  Mass({this.kg, this.lb});

  factory Mass.fromJson(Map<String, dynamic> json) => _$MassFromJson(json);

  Map<String, dynamic> toJson() => _$MassToJson(this);
}
