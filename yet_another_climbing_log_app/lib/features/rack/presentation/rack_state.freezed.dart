// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rack_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RackState {
  List<Shoe> get shoes => throw _privateConstructorUsedError;
  List<Harness> get harnesses => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of RackState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RackStateCopyWith<RackState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RackStateCopyWith<$Res> {
  factory $RackStateCopyWith(RackState value, $Res Function(RackState) then) =
      _$RackStateCopyWithImpl<$Res, RackState>;
  @useResult
  $Res call(
      {List<Shoe> shoes,
      List<Harness> harnesses,
      bool isLoading,
      String? error});
}

/// @nodoc
class _$RackStateCopyWithImpl<$Res, $Val extends RackState>
    implements $RackStateCopyWith<$Res> {
  _$RackStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RackState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoes = null,
    Object? harnesses = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      shoes: null == shoes
          ? _value.shoes
          : shoes // ignore: cast_nullable_to_non_nullable
              as List<Shoe>,
      harnesses: null == harnesses
          ? _value.harnesses
          : harnesses // ignore: cast_nullable_to_non_nullable
              as List<Harness>,
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
abstract class _$$RackStateImplCopyWith<$Res>
    implements $RackStateCopyWith<$Res> {
  factory _$$RackStateImplCopyWith(
          _$RackStateImpl value, $Res Function(_$RackStateImpl) then) =
      __$$RackStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Shoe> shoes,
      List<Harness> harnesses,
      bool isLoading,
      String? error});
}

/// @nodoc
class __$$RackStateImplCopyWithImpl<$Res>
    extends _$RackStateCopyWithImpl<$Res, _$RackStateImpl>
    implements _$$RackStateImplCopyWith<$Res> {
  __$$RackStateImplCopyWithImpl(
      _$RackStateImpl _value, $Res Function(_$RackStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RackState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoes = null,
    Object? harnesses = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$RackStateImpl(
      shoes: null == shoes
          ? _value._shoes
          : shoes // ignore: cast_nullable_to_non_nullable
              as List<Shoe>,
      harnesses: null == harnesses
          ? _value._harnesses
          : harnesses // ignore: cast_nullable_to_non_nullable
              as List<Harness>,
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

class _$RackStateImpl implements _RackState {
  const _$RackStateImpl(
      {final List<Shoe> shoes = const [],
      final List<Harness> harnesses = const [],
      this.isLoading = true,
      this.error})
      : _shoes = shoes,
        _harnesses = harnesses;

  final List<Shoe> _shoes;
  @override
  @JsonKey()
  List<Shoe> get shoes {
    if (_shoes is EqualUnmodifiableListView) return _shoes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shoes);
  }

  final List<Harness> _harnesses;
  @override
  @JsonKey()
  List<Harness> get harnesses {
    if (_harnesses is EqualUnmodifiableListView) return _harnesses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_harnesses);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'RackState(shoes: $shoes, harnesses: $harnesses, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RackStateImpl &&
            const DeepCollectionEquality().equals(other._shoes, _shoes) &&
            const DeepCollectionEquality()
                .equals(other._harnesses, _harnesses) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_shoes),
      const DeepCollectionEquality().hash(_harnesses),
      isLoading,
      error);

  /// Create a copy of RackState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RackStateImplCopyWith<_$RackStateImpl> get copyWith =>
      __$$RackStateImplCopyWithImpl<_$RackStateImpl>(this, _$identity);
}

abstract class _RackState implements RackState {
  const factory _RackState(
      {final List<Shoe> shoes,
      final List<Harness> harnesses,
      final bool isLoading,
      final String? error}) = _$RackStateImpl;

  @override
  List<Shoe> get shoes;
  @override
  List<Harness> get harnesses;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of RackState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RackStateImplCopyWith<_$RackStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
