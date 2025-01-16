import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/climbed_route_model.dart';
import '../data/climbing_log_repository_impl.dart';

part 'climbing_log_controller.g.dart';

@riverpod
class ClimbingLogController extends _$ClimbingLogController {
  @override
  FutureOr<List<ClimbedRoute>> build() async {
    return await _loadClimbedRoutes();
  }

  Future<List<ClimbedRoute>> _loadClimbedRoutes({int? limit, int? offset}) async {
    state = const AsyncValue.loading();
    final value = await AsyncValue.guard(() async {
      final repository = ref.read(climbingLogRepositoryImplProvider.notifier);
      final routes = await repository.getClimbedRoutes(limit: limit, offset: offset);
      return routes.map((json) => ClimbedRoute.fromJson(json)).toList();
    });
    return value.value!;
  }

  Future<void> addClimbedRoute(ClimbedRoute route) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(climbingLogRepositoryImplProvider.notifier);
      await repository.addClimbedRoute({
        'route_name': route.routeName,
        'route_type': route.routeType,
        'route_grade': route.routeGrade,
        'try_number': route.tryNumber,
        'is_done': route.isDone ? 1 : 0,
        'done_type': route.doneType,
        'shoes_id': route.shoesId,
        'harness_id': route.harnessId,
      });
      return _loadClimbedRoutes();
    });
  }

  Future<void> updateClimbedRoute(ClimbedRoute route) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(climbingLogRepositoryImplProvider.notifier);
      await repository.updateClimbedRoute(route.id, {
        'route_name': route.routeName,
        'route_type': route.routeType,
        'route_grade': route.routeGrade,
        'try_number': route.tryNumber,
        'is_done': route.isDone ? 1 : 0,
        'done_type': route.doneType,
      });
      return _loadClimbedRoutes();
    });
  }

  Future<void> deleteClimbedRoute(int id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(climbingLogRepositoryImplProvider.notifier);
      await repository.deleteClimbedRoute(id);
      return _loadClimbedRoutes();
    });
  }
}