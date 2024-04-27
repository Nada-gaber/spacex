import 'package:json_annotation/json_annotation.dart';
import 'links_model.dart';

part 'company_info_model.g.dart';

@JsonSerializable()
class CompanyInfo {
  final String? name;
  final String? ceo;
  final int? founded;
  final int? employees;
  final int? vehicles;
  final String? summary;
  final Links? links;

  CompanyInfo({
    required this.name,
    required this.ceo,
    required this.founded,
    required this.employees,
    required this.vehicles,
    required this.summary,
    required this.links,
  });

  factory CompanyInfo.fromJson(Map<String, dynamic> json) =>
      _$CompanyInfoFromJson(json);
        Map<String, dynamic> toJson() =>  _$CompanyInfoToJson(this);
}



