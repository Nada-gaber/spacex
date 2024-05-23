
import 'package:json_annotation/json_annotation.dart';
part 'launch_pad_model.g.dart';

@JsonSerializable()
class LaunchPad {
  Images? images;
  String? name;
  @JsonKey(name:"full_name")
  String? fullName;
  String? locality;
  String? region;
  @JsonKey(name:"launch_attempts")
  int? launchAttempts;
  @JsonKey(name:"launch_successes")
  int? launchSuccesses;
  String? status;
  String? details;

  LaunchPad(
      {this.images,
        this.name,
        this.fullName,
        this.locality,
        this.region,
        this.launchAttempts,
        this.launchSuccesses,
        this.status,
        this.details,});


  factory LaunchPad.fromJson(Map<String, dynamic> json) => _$LaunchPadFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchPadToJson(this);

}

@JsonSerializable()
class Images {
  List<String>? large;

  Images({this.large});
  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);

}