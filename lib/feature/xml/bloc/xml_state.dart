part of 'xml_bloc.dart';

@freezed
sealed class XMLState with _$XMLState {
  const factory XMLState({
    required XMLStatus status,
    required List<XMLModel> endpointList,
    required List<XMLModel> filterList,
    required ParsingXMLStatus parsingStatus,
    required bool isDropping,
    required ExportStatus exportStatus,
    File? file,
    String? fileName,
    String? basepath,
    Uint8List? fileWeb,
    XmlDocument? xmlDocument,
    String? errorMex,
  }) = _XMLState;

  static XMLState initState() => XMLState(
        status: XMLStatus.initial,
        endpointList: [],
        filterList: [],
        parsingStatus: ParsingXMLStatus.initial,
        exportStatus: ExportStatus.initial,
        isDropping: false,
        file: null,
        fileWeb: null,
        basepath: null,
        fileName: null,
        xmlDocument: null,
        errorMex: null,
      );
}

enum XMLStatus { initial, success, loading, error }

enum ParsingXMLStatus { initial, success, loading, error }

enum ExportStatus { initial, success, loading, error }
