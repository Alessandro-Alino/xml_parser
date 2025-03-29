// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'xml_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$XMLModel {
  String get api;
  Method get method;

  /// Create a copy of XMLModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $XMLModelCopyWith<XMLModel> get copyWith =>
      _$XMLModelCopyWithImpl<XMLModel>(this as XMLModel, _$identity);

  /// Serializes this XMLModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is XMLModel &&
            (identical(other.api, api) || other.api == api) &&
            (identical(other.method, method) || other.method == method));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, api, method);

  @override
  String toString() {
    return 'XMLModel(api: $api, method: $method)';
  }
}

/// @nodoc
abstract mixin class $XMLModelCopyWith<$Res> {
  factory $XMLModelCopyWith(XMLModel value, $Res Function(XMLModel) _then) =
      _$XMLModelCopyWithImpl;
  @useResult
  $Res call({String api, Method method});
}

/// @nodoc
class _$XMLModelCopyWithImpl<$Res> implements $XMLModelCopyWith<$Res> {
  _$XMLModelCopyWithImpl(this._self, this._then);

  final XMLModel _self;
  final $Res Function(XMLModel) _then;

  /// Create a copy of XMLModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? api = null,
    Object? method = null,
  }) {
    return _then(_self.copyWith(
      api: null == api
          ? _self.api
          : api // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as Method,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _XMLModel implements XMLModel {
  const _XMLModel({required this.api, required this.method});
  factory _XMLModel.fromJson(Map<String, dynamic> json) =>
      _$XMLModelFromJson(json);

  @override
  final String api;
  @override
  final Method method;

  /// Create a copy of XMLModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$XMLModelCopyWith<_XMLModel> get copyWith =>
      __$XMLModelCopyWithImpl<_XMLModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$XMLModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _XMLModel &&
            (identical(other.api, api) || other.api == api) &&
            (identical(other.method, method) || other.method == method));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, api, method);

  @override
  String toString() {
    return 'XMLModel(api: $api, method: $method)';
  }
}

/// @nodoc
abstract mixin class _$XMLModelCopyWith<$Res>
    implements $XMLModelCopyWith<$Res> {
  factory _$XMLModelCopyWith(_XMLModel value, $Res Function(_XMLModel) _then) =
      __$XMLModelCopyWithImpl;
  @override
  @useResult
  $Res call({String api, Method method});
}

/// @nodoc
class __$XMLModelCopyWithImpl<$Res> implements _$XMLModelCopyWith<$Res> {
  __$XMLModelCopyWithImpl(this._self, this._then);

  final _XMLModel _self;
  final $Res Function(_XMLModel) _then;

  /// Create a copy of XMLModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? api = null,
    Object? method = null,
  }) {
    return _then(_XMLModel(
      api: null == api
          ? _self.api
          : api // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as Method,
    ));
  }
}

// dart format on
