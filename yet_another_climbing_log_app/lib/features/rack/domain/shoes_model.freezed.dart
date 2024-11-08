// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shoes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Shoe _$ShoeFromJson(Map<String, dynamic> json) {
  return _Shoe.fromJson(json);
}

/// @nodoc
mixin _$Shoe {
  int get id => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  double get size => throw _privateConstructorUsedError;

  /// Serializes this Shoe to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Shoe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoeCopyWith<Shoe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoeCopyWith<$Res> {
  factory $ShoeCopyWith(Shoe value, $Res Function(Shoe) then) =
      _$ShoeCopyWithImpl<$Res, Shoe>;
  @useResult
  $Res call({int id, String brand, String model, double size});
}

/// @nodoc
class _$ShoeCopyWithImpl<$Res, $Val extends Shoe>
    implements $ShoeCopyWith<$Res> {
  _$ShoeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Shoe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brand = null,
    Object? model = null,
    Object? size = null,
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
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoeImplCopyWith<$Res> implements $ShoeCopyWith<$Res> {
  factory _$$ShoeImplCopyWith(
          _$ShoeImpl value, $Res Function(_$ShoeImpl) then) =
      __$$ShoeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String brand, String model, double size});
}

/// @nodoc
class __$$ShoeImplCopyWithImpl<$Res>
    extends _$ShoeCopyWithImpl<$Res, _$ShoeImpl>
    implements _$$ShoeImplCopyWith<$Res> {
  __$$ShoeImplCopyWithImpl(_$ShoeImpl _value, $Res Function(_$ShoeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Shoe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brand = null,
    Object? model = null,
    Object? size = null,
  }) {
    return _then(_$ShoeImpl(
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
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShoeImpl implements _Shoe {
  const _$ShoeImpl(
      {required this.id,
      required this.brand,
      required this.model,
      required this.size});

  factory _$ShoeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoeImplFromJson(json);

  @override
  final int id;
  @override
  final String brand;
  @override
  final String model;
  @override
  final double size;

  @override
  String toString() {
    return 'Shoe(id: $id, brand: $brand, model: $model, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, brand, model, size);

  /// Create a copy of Shoe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoeImplCopyWith<_$ShoeImpl> get copyWith =>
      __$$ShoeImplCopyWithImpl<_$ShoeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoeImplToJson(
      this,
    );
  }
}

abstract class _Shoe implements Shoe {
  const factory _Shoe(
      {required final int id,
      required final String brand,
      required final String model,
      required final double size}) = _$ShoeImpl;

  factory _Shoe.fromJson(Map<String, dynamic> json) = _$ShoeImpl.fromJson;

  @override
  int get id;
  @override
  String get brand;
  @override
  String get model;
  @override
  double get size;

  /// Create a copy of Shoe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoeImplCopyWith<_$ShoeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
