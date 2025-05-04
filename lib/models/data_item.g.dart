// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataItemImpl _$$DataItemImplFromJson(Map<String, dynamic> json) =>
    _$DataItemImpl(
      id: json['id'] as String,
      localPath: json['localPath'] as String,
      label: json['label'] as String? ?? '',
      synced: json['synced'] as bool? ?? false,
    );

Map<String, dynamic> _$$DataItemImplToJson(_$DataItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'localPath': instance.localPath,
      'label': instance.label,
      'synced': instance.synced,
    };
