// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'climbed_route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClimbedRouteImpl _$$ClimbedRouteImplFromJson(Map<String, dynamic> json) =>
    _$ClimbedRouteImpl(
      id: (json['id'] as num).toInt(),
      routeName: json['routeName'] as String,
      routeType: json['routeType'] as String,
      routeGrade: json['routeGrade'] as String,
      tryNumber: (json['tryNumber'] as num).toInt(),
      isDone: json['isDone'] as bool,
      doneType: json['doneType'] as String,
      shoesId: (json['shoesId'] as num?)?.toInt(),
      harnessId: (json['harnessId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ClimbedRouteImplToJson(_$ClimbedRouteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'routeName': instance.routeName,
      'routeType': instance.routeType,
      'routeGrade': instance.routeGrade,
      'tryNumber': instance.tryNumber,
      'isDone': instance.isDone,
      'doneType': instance.doneType,
      'shoesId': instance.shoesId,
      'harnessId': instance.harnessId,
    };
