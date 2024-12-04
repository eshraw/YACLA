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
    await DatabaseHelper.instance.insertClimbedRoute(route);
  }

  Future<void> updateClimbedRoute(int id, Map<String, dynamic> route) async {
    await DatabaseHelper.instance.updateClimbedRoute(id, route);
  }

  Future<void> deleteClimbedRoute(int id) async {
    await DatabaseHelper.instance.deleteClimbedRoute(id);
  }
}
