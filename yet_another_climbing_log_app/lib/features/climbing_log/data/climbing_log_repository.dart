abstract class ClimbingLogRepository {
  Future<List<Map<String, dynamic>>> getClimbedRoutes({int? limit, int? offset});
  Future<Map<String, dynamic>?> getClimbedRouteById(int id);
  Future<void> addClimbedRoute(Map<String, dynamic> route);
  Future<void> updateClimbedRoute(int id, Map<String, dynamic> route);
  Future<void> deleteClimbedRoute(int id);
}
