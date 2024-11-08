import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/shoes_model.dart';
import '../domain/harnesses_model.dart';

part 'rack_state.freezed.dart';

@freezed
class RackState with _$RackState {
  const factory RackState({
    @Default([]) List<Shoe> shoes,
    @Default([]) List<Harness> harnesses,
    @Default(true) bool isLoading,
    String? error,
  }) = _RackState;
} 