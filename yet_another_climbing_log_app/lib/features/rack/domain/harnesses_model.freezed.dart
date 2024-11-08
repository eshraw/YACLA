// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'harnesses_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Harness _$HarnessFromJson(Map<String, dynamic> json) {
  return _Harness.fromJson(json);
}

/// @nodoc
mixin _$Harness {
  int get id => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;

  /// Serializes this Harness to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Harness
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HarnessCopyWith<Harness> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HarnessCopyWith<$Res> {
  factory $HarnessCopyWith(Harness value, $Res Function(Harness) then) =
      _$HarnessCopyWithImpl<$Res, Harness>;
  @useResult
  $Res call({int id, String brand, String model});
}

/// @nodoc
class _$HarnessCopyWithImpl<$Res, $Val extends Harness>
    implements $HarnessCopyWith<$Res> {
  _$HarnessCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Harness
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brand = null,
    Object? model = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HarnessImplCopyWith<$Res> implements $HarnessCopyWith<$Res> {
  factory _$$HarnessImplCopyWith(
          _$HarnessImpl value, $Res Function(_$HarnessImpl) then) =
      __$$HarnessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String brand, String model});
}

/// @nodoc
class __$$HarnessImplCopyWithImpl<$Res>
    extends _$HarnessCopyWithImpl<$Res, _$HarnessImpl>
    implements _$$HarnessImplCopyWith<$Res> {
  __$$HarnessImplCopyWithImpl(
      _$HarnessImpl _value, $Res Function(_$HarnessImpl) _then)
      : super(_value, _then);

  /// Create a copy of Harness
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brand = null,
    Object? model = null,
  }) {
    return _then(_$HarnessImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HarnessImpl implements _Harness {
  const _$HarnessImpl(
      {required this.id, required this.brand, required this.model});

  factory _$HarnessImpl.fromJson(Map<String, dynamic> json) =>
      _$$HarnessImplFromJson(json);

  @override
  final int id;
  @override
  final String brand;
  @override
  final String model;

  @override
  String toString() {
    return 'Harness(id: $id, brand: $brand, model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HarnessImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, brand, model);

  /// Create a copy of Harness
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HarnessImplCopyWith<_$HarnessImpl> get copyWith =>
      __$$HarnessImplCopyWithImpl<_$HarnessImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HarnessImplToJson(
      this,
    );
  }
}

abstract class _Harness implements Harness {
  const factory _Harness(
      {required final int id,
      required final String brand,
      required final String model}) = _$HarnessImpl;

  factory _Harness.fromJson(Map<String, dynamic> json) = _$HarnessImpl.fromJson;

  @override
  int get id;
  @override
  String get brand;
  @override
  String get model;

  /// Create a copy of Harness
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HarnessImplCopyWith<_$HarnessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
