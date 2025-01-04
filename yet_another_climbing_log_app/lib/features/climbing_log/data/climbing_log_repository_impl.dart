import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'climbing_log_repository.dart';
import 'climbing_log_local_datasource.dart';

part 'climbing_log_repository_impl.g.dart';

@Riverpod(keepAlive: true)
class ClimbingLogRepositoryImpl extends AsyncNotifier<void> implements ClimbingLogRepository {
  @override
  FutureOr<void> build() {}

  @override
  Future<List<Map<String, dynamic>>> getClimbedRoutes({int? limit, int? offset}) async {
    final datasource = ref.read(climbingLogLocalDatasourceProvider.notifier);
    return await datasource.getClimbedRoutes(limit: limit, offset: offset);
  }

  @override
  Future<Map<String, dynamic>?> getClimbedRouteById(int id) async {
    final datasource = ref.read(climbingLogLocalDatasourceProvider.notifier);
    return await datasource.getClimbedRouteById(id);
  }

  @override
  Future<void> addClimbedRoute(Map<String, dynamic> route) async {
    final datasource = ref.read(climbingLogLocalDatasourceProvider.notifier);
    await datasource.addClimbedRoute(route);
  }

  @override
  Future<void> updateClimbedRoute(int id, Map<String, dynamic> route) async {
    final datasource = ref.read(climbingLogLocalDatasourceProvider.notifier);
    await datasource.updateClimbedRoute(id, route);
  }

  @override
  Future<void> deleteClimbedRoute(int id) async {
    final datasource = ref.read(climbingLogLocalDatasourceProvider.notifier);
    await datasource.deleteClimbedRoute(id);
  }
}
