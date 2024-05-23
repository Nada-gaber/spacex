// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyInfo _$CompanyInfoFromJson(Map<String, dynamic> json) => CompanyInfo(
      name: json['name'] as String?,
      ceo: json['ceo'] as String?,
      founded: (json['founded'] as num?)?.toInt(),
      employees: (json['employees'] as num?)?.toInt(),
      vehicles: (json['vehicles'] as num?)?.toInt(),
      summary: json['summary'] as String?,
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompanyInfoToJson(CompanyInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'ceo': instance.ceo,
      'founded': instance.founded,
      'employees': instance.employees,
      'vehicles': instance.vehicles,
      'summary': instance.summary,
      'links': instance.links,
    };
