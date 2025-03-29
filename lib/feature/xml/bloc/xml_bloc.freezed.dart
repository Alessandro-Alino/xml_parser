// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'xml_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$XMLEvent implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'XMLEvent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is XMLEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'XMLEvent()';
  }
}

/// @nodoc
class $XMLEventCopyWith<$Res> {
  $XMLEventCopyWith(XMLEvent _, $Res Function(XMLEvent) __);
}

/// @nodoc

class _InitXMLEvent with DiagnosticableTreeMixin implements XMLEvent {
  const _InitXMLEvent();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'XMLEvent.initXML'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _InitXMLEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'XMLEvent.initXML()';
  }
}

/// @nodoc

class _SelectXMLEvent with DiagnosticableTreeMixin implements XMLEvent {
  const _SelectXMLEvent();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'XMLEvent.selectXML'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SelectXMLEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'XMLEvent.selectXML()';
  }
}

/// @nodoc

class _ParsingXMLEvent with DiagnosticableTreeMixin implements XMLEvent {
  const _ParsingXMLEvent();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'XMLEvent.parsingXML'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ParsingXMLEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'XMLEvent.parsingXML()';
  }
}

/// @nodoc

class _FilterXMLEvent with DiagnosticableTreeMixin implements XMLEvent {
  const _FilterXMLEvent({this.method, this.reset});

  final Method? method;
  final bool? reset;

  /// Create a copy of XMLEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FilterXMLEventCopyWith<_FilterXMLEvent> get copyWith =>
      __$FilterXMLEventCopyWithImpl<_FilterXMLEvent>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'XMLEvent.filterXML'))
      ..add(DiagnosticsProperty('method', method))
      ..add(DiagnosticsProperty('reset', reset));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilterXMLEvent &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.reset, reset) || other.reset == reset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, method, reset);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'XMLEvent.filterXML(method: $method, reset: $reset)';
  }
}

/// @nodoc
abstract mixin class _$FilterXMLEventCopyWith<$Res>
    implements $XMLEventCopyWith<$Res> {
  factory _$FilterXMLEventCopyWith(
          _FilterXMLEvent value, $Res Function(_FilterXMLEvent) _then) =
      __$FilterXMLEventCopyWithImpl;
  @useResult
  $Res call({Method? method, bool? reset});
}

/// @nodoc
class __$FilterXMLEventCopyWithImpl<$Res>
    implements _$FilterXMLEventCopyWith<$Res> {
  __$FilterXMLEventCopyWithImpl(this._self, this._then);

  final _FilterXMLEvent _self;
  final $Res Function(_FilterXMLEvent) _then;

  /// Create a copy of XMLEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? method = freezed,
    Object? reset = freezed,
  }) {
    return _then(_FilterXMLEvent(
      method: freezed == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as Method?,
      reset: freezed == reset
          ? _self.reset
          : reset // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _XMLtoExelEvent with DiagnosticableTreeMixin implements XMLEvent {
  const _XMLtoExelEvent({required final List<XMLModel> apiList})
      : _apiList = apiList;

  final List<XMLModel> _apiList;
  List<XMLModel> get apiList {
    if (_apiList is EqualUnmodifiableListView) return _apiList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_apiList);
  }

  /// Create a copy of XMLEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$XMLtoExelEventCopyWith<_XMLtoExelEvent> get copyWith =>
      __$XMLtoExelEventCopyWithImpl<_XMLtoExelEvent>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'XMLEvent.xmlToExel'))
      ..add(DiagnosticsProperty('apiList', apiList));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _XMLtoExelEvent &&
            const DeepCollectionEquality().equals(other._apiList, _apiList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_apiList));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'XMLEvent.xmlToExel(apiList: $apiList)';
  }
}

/// @nodoc
abstract mixin class _$XMLtoExelEventCopyWith<$Res>
    implements $XMLEventCopyWith<$Res> {
  factory _$XMLtoExelEventCopyWith(
          _XMLtoExelEvent value, $Res Function(_XMLtoExelEvent) _then) =
      __$XMLtoExelEventCopyWithImpl;
  @useResult
  $Res call({List<XMLModel> apiList});
}

/// @nodoc
class __$XMLtoExelEventCopyWithImpl<$Res>
    implements _$XMLtoExelEventCopyWith<$Res> {
  __$XMLtoExelEventCopyWithImpl(this._self, this._then);

  final _XMLtoExelEvent _self;
  final $Res Function(_XMLtoExelEvent) _then;

  /// Create a copy of XMLEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? apiList = null,
  }) {
    return _then(_XMLtoExelEvent(
      apiList: null == apiList
          ? _self._apiList
          : apiList // ignore: cast_nullable_to_non_nullable
              as List<XMLModel>,
    ));
  }
}

/// @nodoc

class _ExportPostmanEvent with DiagnosticableTreeMixin implements XMLEvent {
  const _ExportPostmanEvent({required final List<XMLModel> apiList})
      : _apiList = apiList;

  final List<XMLModel> _apiList;
  List<XMLModel> get apiList {
    if (_apiList is EqualUnmodifiableListView) return _apiList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_apiList);
  }

  /// Create a copy of XMLEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExportPostmanEventCopyWith<_ExportPostmanEvent> get copyWith =>
      __$ExportPostmanEventCopyWithImpl<_ExportPostmanEvent>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'XMLEvent.exportPostman'))
      ..add(DiagnosticsProperty('apiList', apiList));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExportPostmanEvent &&
            const DeepCollectionEquality().equals(other._apiList, _apiList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_apiList));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'XMLEvent.exportPostman(apiList: $apiList)';
  }
}

/// @nodoc
abstract mixin class _$ExportPostmanEventCopyWith<$Res>
    implements $XMLEventCopyWith<$Res> {
  factory _$ExportPostmanEventCopyWith(
          _ExportPostmanEvent value, $Res Function(_ExportPostmanEvent) _then) =
      __$ExportPostmanEventCopyWithImpl;
  @useResult
  $Res call({List<XMLModel> apiList});
}

/// @nodoc
class __$ExportPostmanEventCopyWithImpl<$Res>
    implements _$ExportPostmanEventCopyWith<$Res> {
  __$ExportPostmanEventCopyWithImpl(this._self, this._then);

  final _ExportPostmanEvent _self;
  final $Res Function(_ExportPostmanEvent) _then;

  /// Create a copy of XMLEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? apiList = null,
  }) {
    return _then(_ExportPostmanEvent(
      apiList: null == apiList
          ? _self._apiList
          : apiList // ignore: cast_nullable_to_non_nullable
              as List<XMLModel>,
    ));
  }
}

/// @nodoc

class _OnDropEvent with DiagnosticableTreeMixin implements XMLEvent {
  const _OnDropEvent({required this.isDropping});

  final bool isDropping;

  /// Create a copy of XMLEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OnDropEventCopyWith<_OnDropEvent> get copyWith =>
      __$OnDropEventCopyWithImpl<_OnDropEvent>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'XMLEvent.onDropEvent'))
      ..add(DiagnosticsProperty('isDropping', isDropping));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnDropEvent &&
            (identical(other.isDropping, isDropping) ||
                other.isDropping == isDropping));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDropping);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'XMLEvent.onDropEvent(isDropping: $isDropping)';
  }
}

/// @nodoc
abstract mixin class _$OnDropEventCopyWith<$Res>
    implements $XMLEventCopyWith<$Res> {
  factory _$OnDropEventCopyWith(
          _OnDropEvent value, $Res Function(_OnDropEvent) _then) =
      __$OnDropEventCopyWithImpl;
  @useResult
  $Res call({bool isDropping});
}

/// @nodoc
class __$OnDropEventCopyWithImpl<$Res> implements _$OnDropEventCopyWith<$Res> {
  __$OnDropEventCopyWithImpl(this._self, this._then);

  final _OnDropEvent _self;
  final $Res Function(_OnDropEvent) _then;

  /// Create a copy of XMLEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isDropping = null,
  }) {
    return _then(_OnDropEvent(
      isDropping: null == isDropping
          ? _self.isDropping
          : isDropping // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _OnPerformDropEvent with DiagnosticableTreeMixin implements XMLEvent {
  const _OnPerformDropEvent({required this.dropEvent});

  final PerformDropEvent dropEvent;

  /// Create a copy of XMLEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OnPerformDropEventCopyWith<_OnPerformDropEvent> get copyWith =>
      __$OnPerformDropEventCopyWithImpl<_OnPerformDropEvent>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'XMLEvent.onPerformDropEvent'))
      ..add(DiagnosticsProperty('dropEvent', dropEvent));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnPerformDropEvent &&
            (identical(other.dropEvent, dropEvent) ||
                other.dropEvent == dropEvent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dropEvent);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'XMLEvent.onPerformDropEvent(dropEvent: $dropEvent)';
  }
}

/// @nodoc
abstract mixin class _$OnPerformDropEventCopyWith<$Res>
    implements $XMLEventCopyWith<$Res> {
  factory _$OnPerformDropEventCopyWith(
          _OnPerformDropEvent value, $Res Function(_OnPerformDropEvent) _then) =
      __$OnPerformDropEventCopyWithImpl;
  @useResult
  $Res call({PerformDropEvent dropEvent});
}

/// @nodoc
class __$OnPerformDropEventCopyWithImpl<$Res>
    implements _$OnPerformDropEventCopyWith<$Res> {
  __$OnPerformDropEventCopyWithImpl(this._self, this._then);

  final _OnPerformDropEvent _self;
  final $Res Function(_OnPerformDropEvent) _then;

  /// Create a copy of XMLEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dropEvent = null,
  }) {
    return _then(_OnPerformDropEvent(
      dropEvent: null == dropEvent
          ? _self.dropEvent
          : dropEvent // ignore: cast_nullable_to_non_nullable
              as PerformDropEvent,
    ));
  }
}

/// @nodoc
mixin _$XMLState implements DiagnosticableTreeMixin {
  XMLStatus get status;
  List<XMLModel> get endpointList;
  List<XMLModel> get filterList;
  ParsingXMLStatus get parsingStatus;
  bool get isDropping;
  ExportStatus get exportStatus;
  File? get file;
  String? get fileName;
  String? get basepath;
  Uint8List? get fileWeb;
  XmlDocument? get xmlDocument;
  String? get errorMex;

  /// Create a copy of XMLState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $XMLStateCopyWith<XMLState> get copyWith =>
      _$XMLStateCopyWithImpl<XMLState>(this as XMLState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'XMLState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('endpointList', endpointList))
      ..add(DiagnosticsProperty('filterList', filterList))
      ..add(DiagnosticsProperty('parsingStatus', parsingStatus))
      ..add(DiagnosticsProperty('isDropping', isDropping))
      ..add(DiagnosticsProperty('exportStatus', exportStatus))
      ..add(DiagnosticsProperty('file', file))
      ..add(DiagnosticsProperty('fileName', fileName))
      ..add(DiagnosticsProperty('basepath', basepath))
      ..add(DiagnosticsProperty('fileWeb', fileWeb))
      ..add(DiagnosticsProperty('xmlDocument', xmlDocument))
      ..add(DiagnosticsProperty('errorMex', errorMex));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is XMLState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.endpointList, endpointList) &&
            const DeepCollectionEquality()
                .equals(other.filterList, filterList) &&
            (identical(other.parsingStatus, parsingStatus) ||
                other.parsingStatus == parsingStatus) &&
            (identical(other.isDropping, isDropping) ||
                other.isDropping == isDropping) &&
            (identical(other.exportStatus, exportStatus) ||
                other.exportStatus == exportStatus) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.basepath, basepath) ||
                other.basepath == basepath) &&
            const DeepCollectionEquality().equals(other.fileWeb, fileWeb) &&
            (identical(other.xmlDocument, xmlDocument) ||
                other.xmlDocument == xmlDocument) &&
            (identical(other.errorMex, errorMex) ||
                other.errorMex == errorMex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(endpointList),
      const DeepCollectionEquality().hash(filterList),
      parsingStatus,
      isDropping,
      exportStatus,
      file,
      fileName,
      basepath,
      const DeepCollectionEquality().hash(fileWeb),
      xmlDocument,
      errorMex);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'XMLState(status: $status, endpointList: $endpointList, filterList: $filterList, parsingStatus: $parsingStatus, isDropping: $isDropping, exportStatus: $exportStatus, file: $file, fileName: $fileName, basepath: $basepath, fileWeb: $fileWeb, xmlDocument: $xmlDocument, errorMex: $errorMex)';
  }
}

/// @nodoc
abstract mixin class $XMLStateCopyWith<$Res> {
  factory $XMLStateCopyWith(XMLState value, $Res Function(XMLState) _then) =
      _$XMLStateCopyWithImpl;
  @useResult
  $Res call(
      {XMLStatus status,
      List<XMLModel> endpointList,
      List<XMLModel> filterList,
      ParsingXMLStatus parsingStatus,
      bool isDropping,
      ExportStatus exportStatus,
      File? file,
      String? fileName,
      String? basepath,
      Uint8List? fileWeb,
      XmlDocument? xmlDocument,
      String? errorMex});
}

/// @nodoc
class _$XMLStateCopyWithImpl<$Res> implements $XMLStateCopyWith<$Res> {
  _$XMLStateCopyWithImpl(this._self, this._then);

  final XMLState _self;
  final $Res Function(XMLState) _then;

  /// Create a copy of XMLState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? endpointList = null,
    Object? filterList = null,
    Object? parsingStatus = null,
    Object? isDropping = null,
    Object? exportStatus = null,
    Object? file = freezed,
    Object? fileName = freezed,
    Object? basepath = freezed,
    Object? fileWeb = freezed,
    Object? xmlDocument = freezed,
    Object? errorMex = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as XMLStatus,
      endpointList: null == endpointList
          ? _self.endpointList
          : endpointList // ignore: cast_nullable_to_non_nullable
              as List<XMLModel>,
      filterList: null == filterList
          ? _self.filterList
          : filterList // ignore: cast_nullable_to_non_nullable
              as List<XMLModel>,
      parsingStatus: null == parsingStatus
          ? _self.parsingStatus
          : parsingStatus // ignore: cast_nullable_to_non_nullable
              as ParsingXMLStatus,
      isDropping: null == isDropping
          ? _self.isDropping
          : isDropping // ignore: cast_nullable_to_non_nullable
              as bool,
      exportStatus: null == exportStatus
          ? _self.exportStatus
          : exportStatus // ignore: cast_nullable_to_non_nullable
              as ExportStatus,
      file: freezed == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      fileName: freezed == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      basepath: freezed == basepath
          ? _self.basepath
          : basepath // ignore: cast_nullable_to_non_nullable
              as String?,
      fileWeb: freezed == fileWeb
          ? _self.fileWeb
          : fileWeb // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      xmlDocument: freezed == xmlDocument
          ? _self.xmlDocument
          : xmlDocument // ignore: cast_nullable_to_non_nullable
              as XmlDocument?,
      errorMex: freezed == errorMex
          ? _self.errorMex
          : errorMex // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _XMLState with DiagnosticableTreeMixin implements XMLState {
  const _XMLState(
      {required this.status,
      required final List<XMLModel> endpointList,
      required final List<XMLModel> filterList,
      required this.parsingStatus,
      required this.isDropping,
      required this.exportStatus,
      this.file,
      this.fileName,
      this.basepath,
      this.fileWeb,
      this.xmlDocument,
      this.errorMex})
      : _endpointList = endpointList,
        _filterList = filterList;

  @override
  final XMLStatus status;
  final List<XMLModel> _endpointList;
  @override
  List<XMLModel> get endpointList {
    if (_endpointList is EqualUnmodifiableListView) return _endpointList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_endpointList);
  }

  final List<XMLModel> _filterList;
  @override
  List<XMLModel> get filterList {
    if (_filterList is EqualUnmodifiableListView) return _filterList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterList);
  }

  @override
  final ParsingXMLStatus parsingStatus;
  @override
  final bool isDropping;
  @override
  final ExportStatus exportStatus;
  @override
  final File? file;
  @override
  final String? fileName;
  @override
  final String? basepath;
  @override
  final Uint8List? fileWeb;
  @override
  final XmlDocument? xmlDocument;
  @override
  final String? errorMex;

  /// Create a copy of XMLState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$XMLStateCopyWith<_XMLState> get copyWith =>
      __$XMLStateCopyWithImpl<_XMLState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'XMLState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('endpointList', endpointList))
      ..add(DiagnosticsProperty('filterList', filterList))
      ..add(DiagnosticsProperty('parsingStatus', parsingStatus))
      ..add(DiagnosticsProperty('isDropping', isDropping))
      ..add(DiagnosticsProperty('exportStatus', exportStatus))
      ..add(DiagnosticsProperty('file', file))
      ..add(DiagnosticsProperty('fileName', fileName))
      ..add(DiagnosticsProperty('basepath', basepath))
      ..add(DiagnosticsProperty('fileWeb', fileWeb))
      ..add(DiagnosticsProperty('xmlDocument', xmlDocument))
      ..add(DiagnosticsProperty('errorMex', errorMex));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _XMLState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._endpointList, _endpointList) &&
            const DeepCollectionEquality()
                .equals(other._filterList, _filterList) &&
            (identical(other.parsingStatus, parsingStatus) ||
                other.parsingStatus == parsingStatus) &&
            (identical(other.isDropping, isDropping) ||
                other.isDropping == isDropping) &&
            (identical(other.exportStatus, exportStatus) ||
                other.exportStatus == exportStatus) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.basepath, basepath) ||
                other.basepath == basepath) &&
            const DeepCollectionEquality().equals(other.fileWeb, fileWeb) &&
            (identical(other.xmlDocument, xmlDocument) ||
                other.xmlDocument == xmlDocument) &&
            (identical(other.errorMex, errorMex) ||
                other.errorMex == errorMex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_endpointList),
      const DeepCollectionEquality().hash(_filterList),
      parsingStatus,
      isDropping,
      exportStatus,
      file,
      fileName,
      basepath,
      const DeepCollectionEquality().hash(fileWeb),
      xmlDocument,
      errorMex);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'XMLState(status: $status, endpointList: $endpointList, filterList: $filterList, parsingStatus: $parsingStatus, isDropping: $isDropping, exportStatus: $exportStatus, file: $file, fileName: $fileName, basepath: $basepath, fileWeb: $fileWeb, xmlDocument: $xmlDocument, errorMex: $errorMex)';
  }
}

/// @nodoc
abstract mixin class _$XMLStateCopyWith<$Res>
    implements $XMLStateCopyWith<$Res> {
  factory _$XMLStateCopyWith(_XMLState value, $Res Function(_XMLState) _then) =
      __$XMLStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {XMLStatus status,
      List<XMLModel> endpointList,
      List<XMLModel> filterList,
      ParsingXMLStatus parsingStatus,
      bool isDropping,
      ExportStatus exportStatus,
      File? file,
      String? fileName,
      String? basepath,
      Uint8List? fileWeb,
      XmlDocument? xmlDocument,
      String? errorMex});
}

/// @nodoc
class __$XMLStateCopyWithImpl<$Res> implements _$XMLStateCopyWith<$Res> {
  __$XMLStateCopyWithImpl(this._self, this._then);

  final _XMLState _self;
  final $Res Function(_XMLState) _then;

  /// Create a copy of XMLState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? endpointList = null,
    Object? filterList = null,
    Object? parsingStatus = null,
    Object? isDropping = null,
    Object? exportStatus = null,
    Object? file = freezed,
    Object? fileName = freezed,
    Object? basepath = freezed,
    Object? fileWeb = freezed,
    Object? xmlDocument = freezed,
    Object? errorMex = freezed,
  }) {
    return _then(_XMLState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as XMLStatus,
      endpointList: null == endpointList
          ? _self._endpointList
          : endpointList // ignore: cast_nullable_to_non_nullable
              as List<XMLModel>,
      filterList: null == filterList
          ? _self._filterList
          : filterList // ignore: cast_nullable_to_non_nullable
              as List<XMLModel>,
      parsingStatus: null == parsingStatus
          ? _self.parsingStatus
          : parsingStatus // ignore: cast_nullable_to_non_nullable
              as ParsingXMLStatus,
      isDropping: null == isDropping
          ? _self.isDropping
          : isDropping // ignore: cast_nullable_to_non_nullable
              as bool,
      exportStatus: null == exportStatus
          ? _self.exportStatus
          : exportStatus // ignore: cast_nullable_to_non_nullable
              as ExportStatus,
      file: freezed == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      fileName: freezed == fileName
          ? _self.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      basepath: freezed == basepath
          ? _self.basepath
          : basepath // ignore: cast_nullable_to_non_nullable
              as String?,
      fileWeb: freezed == fileWeb
          ? _self.fileWeb
          : fileWeb // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      xmlDocument: freezed == xmlDocument
          ? _self.xmlDocument
          : xmlDocument // ignore: cast_nullable_to_non_nullable
              as XmlDocument?,
      errorMex: freezed == errorMex
          ? _self.errorMex
          : errorMex // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
