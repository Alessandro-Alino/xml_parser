// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UploadEvent implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'UploadEvent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UploadEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UploadEvent()';
  }
}

/// @nodoc
class $UploadEventCopyWith<$Res> {
  $UploadEventCopyWith(UploadEvent _, $Res Function(UploadEvent) __);
}

/// @nodoc

class _InitEvent with DiagnosticableTreeMixin implements UploadEvent {
  const _InitEvent();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'UploadEvent.init'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _InitEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UploadEvent.init()';
  }
}

/// @nodoc

class _PickFileEvent with DiagnosticableTreeMixin implements UploadEvent {
  const _PickFileEvent();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'UploadEvent.pickFile'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PickFileEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UploadEvent.pickFile()';
  }
}

/// @nodoc

class _UploadFileEvent with DiagnosticableTreeMixin implements UploadEvent {
  const _UploadFileEvent(
      {required this.filePath, this.fileWeb, required this.fileName});

  final String filePath;
  final Uint8List? fileWeb;
  final String fileName;

  /// Create a copy of UploadEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UploadFileEventCopyWith<_UploadFileEvent> get copyWith =>
      __$UploadFileEventCopyWithImpl<_UploadFileEvent>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'UploadEvent.uploadFile'))
      ..add(DiagnosticsProperty('filePath', filePath))
      ..add(DiagnosticsProperty('fileWeb', fileWeb))
      ..add(DiagnosticsProperty('fileName', fileName));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UploadFileEvent &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            const DeepCollectionEquality().equals(other.fileWeb, fileWeb) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filePath,
      const DeepCollectionEquality().hash(fileWeb), fileName);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UploadEvent.uploadFile(filePath: $filePath, fileWeb: $fileWeb, fileName: $fileName)';
  }
}

/// @nodoc
abstract mixin class _$UploadFileEventCopyWith<$Res>
    implements $UploadEventCopyWith<$Res> {
  factory _$UploadFileEventCopyWith(
          _UploadFileEvent value, $Res Function(_UploadFileEvent) _then) =
      __$UploadFileEventCopyWithImpl;
  @useResult
  $Res call({String filePath, Uint8List? fileWeb, String fileName});
}

/// @nodoc
class __$UploadFileEventCopyWithImpl<$Res>
    implements _$UploadFileEventCopyWith<$Res> {
  __$UploadFileEventCopyWithImpl(this._self, this._then);

  final _UploadFileEvent _self;
  final $Res Function(_UploadFileEvent) _then;

  /// Create a copy of UploadEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? filePath = null,
    Object? fileWeb = freezed,
    Object? fileName = null,
  }) {
    return _then(_UploadFileEvent(
      filePath: null == filePath
          ? _self.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      fileWeb: freezed == fileWeb
          ? _self.fileWeb
          : fileWeb // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      fileName: null == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$UploadState implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'UploadState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UploadState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UploadState()';
  }
}

/// @nodoc
class $UploadStateCopyWith<$Res> {
  $UploadStateCopyWith(UploadState _, $Res Function(UploadState) __);
}

/// @nodoc

class InitialState with DiagnosticableTreeMixin implements UploadState {
  const InitialState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'UploadState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UploadState.initial()';
  }
}

/// @nodoc

class LoadingState with DiagnosticableTreeMixin implements UploadState {
  const LoadingState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'UploadState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UploadState.loading()';
  }
}

/// @nodoc

class SelectedState with DiagnosticableTreeMixin implements UploadState {
  const SelectedState(
      {required this.file, this.fileWeb, required this.fileName});

  final File file;
  final Uint8List? fileWeb;
  final String fileName;

  /// Create a copy of UploadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectedStateCopyWith<SelectedState> get copyWith =>
      _$SelectedStateCopyWithImpl<SelectedState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'UploadState.selected'))
      ..add(DiagnosticsProperty('file', file))
      ..add(DiagnosticsProperty('fileWeb', fileWeb))
      ..add(DiagnosticsProperty('fileName', fileName));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectedState &&
            (identical(other.file, file) || other.file == file) &&
            const DeepCollectionEquality().equals(other.fileWeb, fileWeb) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file,
      const DeepCollectionEquality().hash(fileWeb), fileName);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UploadState.selected(file: $file, fileWeb: $fileWeb, fileName: $fileName)';
  }
}

/// @nodoc
abstract mixin class $SelectedStateCopyWith<$Res>
    implements $UploadStateCopyWith<$Res> {
  factory $SelectedStateCopyWith(
          SelectedState value, $Res Function(SelectedState) _then) =
      _$SelectedStateCopyWithImpl;
  @useResult
  $Res call({File file, Uint8List? fileWeb, String fileName});
}

/// @nodoc
class _$SelectedStateCopyWithImpl<$Res>
    implements $SelectedStateCopyWith<$Res> {
  _$SelectedStateCopyWithImpl(this._self, this._then);

  final SelectedState _self;
  final $Res Function(SelectedState) _then;

  /// Create a copy of UploadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? file = null,
    Object? fileWeb = freezed,
    Object? fileName = null,
  }) {
    return _then(SelectedState(
      file: null == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      fileWeb: freezed == fileWeb
          ? _self.fileWeb
          : fileWeb // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      fileName: null == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UploadedState with DiagnosticableTreeMixin implements UploadState {
  const UploadedState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'UploadState.uploaded'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UploadedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UploadState.uploaded()';
  }
}

/// @nodoc

class ErrorState with DiagnosticableTreeMixin implements UploadState {
  const ErrorState(this.errMex);

  final String errMex;

  /// Create a copy of UploadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorStateCopyWith<ErrorState> get copyWith =>
      _$ErrorStateCopyWithImpl<ErrorState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'UploadState.error'))
      ..add(DiagnosticsProperty('errMex', errMex));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorState &&
            (identical(other.errMex, errMex) || other.errMex == errMex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errMex);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UploadState.error(errMex: $errMex)';
  }
}

/// @nodoc
abstract mixin class $ErrorStateCopyWith<$Res>
    implements $UploadStateCopyWith<$Res> {
  factory $ErrorStateCopyWith(
          ErrorState value, $Res Function(ErrorState) _then) =
      _$ErrorStateCopyWithImpl;
  @useResult
  $Res call({String errMex});
}

/// @nodoc
class _$ErrorStateCopyWithImpl<$Res> implements $ErrorStateCopyWith<$Res> {
  _$ErrorStateCopyWithImpl(this._self, this._then);

  final ErrorState _self;
  final $Res Function(ErrorState) _then;

  /// Create a copy of UploadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errMex = null,
  }) {
    return _then(ErrorState(
      null == errMex
          ? _self.errMex
          : errMex // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
