// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'harnesses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HarnessImpl _$$HarnessImplFromJson(Map<String, dynamic> json) =>
    _$HarnessImpl(
      id: (json['id'] as num).toInt(),
      brand: json['brand'] as String,
      model: json['model'] as String,
    );

Map<String, dynamic> _$$HarnessImplToJson(_$HarnessImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'model': instance.model,
    };
