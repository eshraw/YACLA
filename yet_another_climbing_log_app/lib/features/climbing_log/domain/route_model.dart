import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_model.freezed.dart';
part 'route_model.g.dart';

@freezed
class Route with _$Route {
  const factory Route({
    required int id,
    required String name,
    required String type,
    required String grade,
    required int sectorId,
  }) = _Route;

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson({
    'id': json['route_id'],
    'name': json['route_name'], 
    'type': json['route_type'],
    'grade': json['route_grade'],
    'sectorId': json['sector_id'],
  });
}
