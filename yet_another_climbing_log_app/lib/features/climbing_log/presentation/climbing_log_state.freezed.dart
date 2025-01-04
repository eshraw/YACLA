// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'climbing_log_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClimbingLogState {
  List<ClimbedRoute> get climbedRoutes => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of ClimbingLogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClimbingLogStateCopyWith<ClimbingLogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClimbingLogStateCopyWith<$Res> {
  factory $ClimbingLogStateCopyWith(
          ClimbingLogState value, $Res Function(ClimbingLogState) then) =
      _$ClimbingLogStateCopyWithImpl<$Res, ClimbingLogState>;
  @useResult
  $Res call({List<ClimbedRoute> climbedRoutes, bool isLoading, String? error});
}

/// @nodoc
class _$ClimbingLogStateCopyWithImpl<$Res, $Val extends ClimbingLogState>
    implements $ClimbingLogStateCopyWith<$Res> {
  _$ClimbingLogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClimbingLogState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? climbedRoutes = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      climbedRoutes: null == climbedRoutes
          ? _value.climbedRoutes
          : climbedRoutes // ignore: cast_nullable_to_non_nullable
              as List<ClimbedRoute>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClimbingLogStateImplCopyWith<$Res>
    implements $ClimbingLogStateCopyWith<$Res> {
  factory _$$ClimbingLogStateImplCopyWith(_$ClimbingLogStateImpl value,
          $Res Function(_$ClimbingLogStateImpl) then) =
      __$$ClimbingLogStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ClimbedRoute> climbedRoutes, bool isLoading, String? error});
}

/// @nodoc
class __$$ClimbingLogStateImplCopyWithImpl<$Res>
    extends _$ClimbingLogStateCopyWithImpl<$Res, _$ClimbingLogStateImpl>
    implements _$$ClimbingLogStateImplCopyWith<$Res> {
  __$$ClimbingLogStateImplCopyWithImpl(_$ClimbingLogStateImpl _value,
      $Res Function(_$ClimbingLogStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClimbingLogState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? climbedRoutes = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$ClimbingLogStateImpl(
      climbedRoutes: null == climbedRoutes
          ? _value._climbedRoutes
          : climbedRoutes // ignore: cast_nullable_to_non_nullable
              as List<ClimbedRoute>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ClimbingLogStateImpl implements _ClimbingLogState {
  const _$ClimbingLogStateImpl(
      {final List<ClimbedRoute> climbedRoutes = const [],
      this.isLoading = true,
      this.error})
      : _climbedRoutes = climbedRoutes;

  final List<ClimbedRoute> _climbedRoutes;
  @override
  @JsonKey()
  List<ClimbedRoute> get climbedRoutes {
    if (_climbedRoutes is EqualUnmodifiableListView) return _climbedRoutes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_climbedRoutes);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'ClimbingLogState(climbedRoutes: $climbedRoutes, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClimbingLogStateImpl &&
            const DeepCollectionEquality()
                .equals(other._climbedRoutes, _climbedRoutes) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_climbedRoutes), isLoading, error);

  /// Create a copy of ClimbingLogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClimbingLogStateImplCopyWith<_$ClimbingLogStateImpl> get copyWith =>
      __$$ClimbingLogStateImplCopyWithImpl<_$ClimbingLogStateImpl>(
          this, _$identity);
}

abstract class _ClimbingLogState implements ClimbingLogState {
  const factory _ClimbingLogState(
      {final List<ClimbedRoute> climbedRoutes,
      final bool isLoading,
      final String? error}) = _$ClimbingLogStateImpl;

  @override
  List<ClimbedRoute> get climbedRoutes;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of ClimbingLogState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClimbingLogStateImplCopyWith<_$ClimbingLogStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
