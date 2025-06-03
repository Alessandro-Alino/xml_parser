// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ApiEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ApiEvent()';
  }
}

/// @nodoc
class $ApiEventCopyWith<$Res> {
  $ApiEventCopyWith(ApiEvent _, $Res Function(ApiEvent) __);
}

/// @nodoc

class _InitEvent implements ApiEvent {
  const _InitEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _InitEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ApiEvent.init()';
  }
}

/// @nodoc

class _GenerateApiEvent implements ApiEvent {
  const _GenerateApiEvent({required this.input});

  final String input;

  /// Create a copy of ApiEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GenerateApiEventCopyWith<_GenerateApiEvent> get copyWith =>
      __$GenerateApiEventCopyWithImpl<_GenerateApiEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GenerateApiEvent &&
            (identical(other.input, input) || other.input == input));
  }

  @override
  int get hashCode => Object.hash(runtimeType, input);

  @override
  String toString() {
    return 'ApiEvent.generateApi(input: $input)';
  }
}

/// @nodoc
abstract mixin class _$GenerateApiEventCopyWith<$Res>
    implements $ApiEventCopyWith<$Res> {
  factory _$GenerateApiEventCopyWith(
          _GenerateApiEvent value, $Res Function(_GenerateApiEvent) _then) =
      __$GenerateApiEventCopyWithImpl;
  @useResult
  $Res call({String input});
}

/// @nodoc
class __$GenerateApiEventCopyWithImpl<$Res>
    implements _$GenerateApiEventCopyWith<$Res> {
  __$GenerateApiEventCopyWithImpl(this._self, this._then);

  final _GenerateApiEvent _self;
  final $Res Function(_GenerateApiEvent) _then;

  /// Create a copy of ApiEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? input = null,
  }) {
    return _then(_GenerateApiEvent(
      input: null == input
          ? _self.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ApiState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ApiState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ApiState()';
  }
}

/// @nodoc
class $ApiStateCopyWith<$Res> {
  $ApiStateCopyWith(ApiState _, $Res Function(ApiState) __);
}

/// @nodoc

class InitialState implements ApiState {
  const InitialState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ApiState.initial()';
  }
}

/// @nodoc

class LoadingState implements ApiState {
  const LoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ApiState.loading()';
  }
}

/// @nodoc

class SuccessState implements ApiState {
  const SuccessState({required this.generatedApi});

  final String generatedApi;

  /// Create a copy of ApiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessStateCopyWith<SuccessState> get copyWith =>
      _$SuccessStateCopyWithImpl<SuccessState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessState &&
            (identical(other.generatedApi, generatedApi) ||
                other.generatedApi == generatedApi));
  }

  @override
  int get hashCode => Object.hash(runtimeType, generatedApi);

  @override
  String toString() {
    return 'ApiState.success(generatedApi: $generatedApi)';
  }
}

/// @nodoc
abstract mixin class $SuccessStateCopyWith<$Res>
    implements $ApiStateCopyWith<$Res> {
  factory $SuccessStateCopyWith(
          SuccessState value, $Res Function(SuccessState) _then) =
      _$SuccessStateCopyWithImpl;
  @useResult
  $Res call({String generatedApi});
}

/// @nodoc
class _$SuccessStateCopyWithImpl<$Res> implements $SuccessStateCopyWith<$Res> {
  _$SuccessStateCopyWithImpl(this._self, this._then);

  final SuccessState _self;
  final $Res Function(SuccessState) _then;

  /// Create a copy of ApiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? generatedApi = null,
  }) {
    return _then(SuccessState(
      generatedApi: null == generatedApi
          ? _self.generatedApi
          : generatedApi // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ErrorState implements ApiState {
  const ErrorState({required this.errorMex});

  final String errorMex;

  /// Create a copy of ApiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorStateCopyWith<ErrorState> get copyWith =>
      _$ErrorStateCopyWithImpl<ErrorState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorState &&
            (identical(other.errorMex, errorMex) ||
                other.errorMex == errorMex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMex);

  @override
  String toString() {
    return 'ApiState.error(errorMex: $errorMex)';
  }
}

/// @nodoc
abstract mixin class $ErrorStateCopyWith<$Res>
    implements $ApiStateCopyWith<$Res> {
  factory $ErrorStateCopyWith(
          ErrorState value, $Res Function(ErrorState) _then) =
      _$ErrorStateCopyWithImpl;
  @useResult
  $Res call({String errorMex});
}

/// @nodoc
class _$ErrorStateCopyWithImpl<$Res> implements $ErrorStateCopyWith<$Res> {
  _$ErrorStateCopyWithImpl(this._self, this._then);

  final ErrorState _self;
  final $Res Function(ErrorState) _then;

  /// Create a copy of ApiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMex = null,
  }) {
    return _then(ErrorState(
      errorMex: null == errorMex
          ? _self.errorMex
          : errorMex // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
