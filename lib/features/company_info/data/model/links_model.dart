import 'package:json_annotation/json_annotation.dart';

part 'links_model.g.dart';

@JsonSerializable()
class Links {
  final String? website;
  final String? flickr;
  final String? twitter;

  Links(this.website, this.flickr, this.twitter);

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
      Map<String, dynamic> toJson() => _$LinksToJson(this);

}