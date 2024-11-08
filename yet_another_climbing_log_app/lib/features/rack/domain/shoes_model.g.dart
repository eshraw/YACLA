// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoeImpl _$$ShoeImplFromJson(Map<String, dynamic> json) => _$ShoeImpl(
      id: (json['id'] as num).toInt(),
      brand: json['brand'] as String,
      model: json['model'] as String,
      size: (json['size'] as num).toDouble(),
    );

Map<String, dynamic> _$$ShoeImplToJson(_$ShoeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'model': instance.model,
      'size': instance.size,
    };
