// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ships_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ships _$ShipsFromJson(Map<String, dynamic> json) => Ships(
      image: json['image'] as String?,
      name: json['name'] as String?,
      yearBuilt: (json['year_built'] as num?)?.toInt(),
      massKg: (json['mass_kg'] as num?)?.toInt(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ShipsToJson(Ships instance) => <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'year_built': instance.yearBuilt,
      'mass_kg': instance.massKg,
      'type': instance.type,
    };
