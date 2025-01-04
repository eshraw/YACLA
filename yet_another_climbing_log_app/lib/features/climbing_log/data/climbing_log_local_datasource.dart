import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yet_another_climbing_log_app/shared/database_helper.dart';

part 'climbing_log_local_datasource.g.dart';

@riverpod
class ClimbingLogLocalDatasource extends _$ClimbingLogLocalDatasource {
  @override
  FutureOr<void> build() {}

  Future<List<Map<String, dynamic>>> getClimbedRoutes({int? limit, int? offset}) async {
    return await DatabaseHelper.instance.getAllClimbedRoutes(limit: limit, offset: offset);
  }

  Future<Map<String, dynamic>?> getClimbedRouteById(int id) async {
    return await DatabaseHelper.instance.getClimbedRouteById(id);
  }

  Future<void> addClimbedRoute(Map<String, dynamic> route) async {
    final db = await DatabaseHelper.instance.database;
    
    // First, insert into routes table
    final routeId = await db.insert('routes', {
      'route_name': route['route_name'],
      'route_type': route['route_type'],
      'route_grade': route['route_grade'],
      'sector_id': route['sector_id'] ?? 1,  // Default sector if none specified
    });

    // Then insert into climbed_routes table
    await db.insert('climbed_routes', {
      'route_id': routeId,
      'try_number': route['try_number'],
      'is_done': route['is_done'],
      'done_type': route['done_type'],
      'shoes_id': route['shoes_id'],
      'harness_id': route['harness_id'],
    });
  }

  Future<void> updateClimbedRoute(int id, Map<String, dynamic> route) async {
    await DatabaseHelper.instance.updateClimbedRoute(id, route);
  }

  Future<void> deleteClimbedRoute(int id) async {
    await DatabaseHelper.instance.deleteClimbedRoute(id);
  }
}
