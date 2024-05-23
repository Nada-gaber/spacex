// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_pad_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchPad _$LaunchPadFromJson(Map<String, dynamic> json) => LaunchPad(
      images: json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
      name: json['name'] as String?,
      fullName: json['full_name'] as String?,
      locality: json['locality'] as String?,
      region: json['region'] as String?,
      launchAttempts: (json['launch_attempts'] as num?)?.toInt(),
      launchSuccesses: (json['launch_successes'] as num?)?.toInt(),
      status: json['status'] as String?,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$LaunchPadToJson(LaunchPad instance) => <String, dynamic>{
      'images': instance.images,
      'name': instance.name,
      'full_name': instance.fullName,
      'locality': instance.locality,
      'region': instance.region,
      'launch_attempts': instance.launchAttempts,
      'launch_successes': instance.launchSuccesses,
      'status': instance.status,
      'details': instance.details,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      large:
          (json['large'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'large': instance.large,
    };
