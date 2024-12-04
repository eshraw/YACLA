import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/climbed_route_model.dart';

part 'climbing_log_state.freezed.dart';

@freezed
class ClimbingLogState with _$ClimbingLogState {
  const factory ClimbingLogState({
    @Default([]) List<ClimbedRoute> climbedRoutes,
    @Default(true) bool isLoading,
    String? error,
  }) = _ClimbingLogState;
}
