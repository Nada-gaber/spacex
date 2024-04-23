// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rocket _$RocketFromJson(Map<String, dynamic> json) => Rocket(
      height: (json['height'] as num?)?.toDouble(),
      mass: (json['mass'] as num?)?.toDouble(),
      flickrImages: (json['flickrImages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      type: json['type'] as String?,
      costPerLaunch: json['costPerLaunch'] as int?,
      firstFlight: json['firstFlight'] as String?,
      country: json['country'] as String?,
      company: json['company'] as String?,
      wikipedia: json['wikipedia'] as String?,
      description: json['description'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$RocketToJson(Rocket instance) => <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'height': instance.height,
      'mass': instance.mass,
      'costPerLaunch': instance.costPerLaunch,
      'firstFlight': instance.firstFlight,
      'country': instance.country,
      'company': instance.company,
      'wikipedia': instance.wikipedia,
      'description': instance.description,
      'id': instance.id,
      'flickrImages': instance.flickrImages,
    };
