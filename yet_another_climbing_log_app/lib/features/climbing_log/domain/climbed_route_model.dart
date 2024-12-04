import 'package:freezed_annotation/freezed_annotation.dart';

part 'climbed_route_model.freezed.dart';
part 'climbed_route_model.g.dart';

@freezed
class ClimbedRoute with _$ClimbedRoute {
  const factory ClimbedRoute({
    required int id,
    required String routeName,
    required String routeType,
    required String routeGrade,
    required int tryNumber,
    required bool isDone,
    required String doneType,
    int? shoesId,
    int? harnessId,
  }) = _ClimbedRoute;

  factory ClimbedRoute.fromJson(Map<String, dynamic> json) => _$ClimbedRouteFromJson({
    'id': json['climbed_routes_id'],
    'routeName': json['route_name'],
    'routeType': json['route_type'],
    'routeGrade': json['route_grade'],
    'tryNumber': json['try_number'],
    'isDone': json['is_done'] == 1,
    'doneType': json['done_type'],
    'shoesId': json['shoes_id'],
    'harnessId': json['harness_id'],
  });
}
