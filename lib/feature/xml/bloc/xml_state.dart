part of 'xml_bloc.dart';

enum XMLStatus { initial, success, loading, error }

enum ParsingXMLStatus { initial, success, loading, error }

class XMLState extends Equatable {
  const XMLState({
    required this.status,
    required this.parsingStatus,
    required this.file,
    required this.fileWeb,
    required this.fileName,
    required this.xmlDocument,
    required this.proxiesList,
    required this.filterList,
    this.errorMex,
  });

  final XMLStatus status;
  final ParsingXMLStatus parsingStatus;
  final File? file;
  final Uint8List? fileWeb;
  final String? fileName;
  final XmlDocument? xmlDocument;
  final List<XMLModel> proxiesList;
  final List<XMLModel> filterList;
  final String? errorMex;

  // CopyWith method
  XMLState copyWith({
    XMLStatus? status,
    ParsingXMLStatus? parsingStatus,
    File? file,
    Uint8List? fileWeb,
    String? fileName,
    XmlDocument? xmlDocument,
    List<XMLModel>? proxiesList,
    List<XMLModel>? filterList,
    String? errorMex,
  }) =>
      XMLState(
        status: status ?? this.status,
        parsingStatus: parsingStatus ?? this.parsingStatus,
        file: file ?? this.file,
        fileWeb: fileWeb ?? this.fileWeb,
        fileName: fileName ?? this.fileName,
        xmlDocument: xmlDocument ?? this.xmlDocument,
        proxiesList: proxiesList ?? this.proxiesList,
        filterList: filterList ?? this.filterList,
        errorMex: errorMex ?? this.errorMex,
      );

  static initState() => XMLState(
        status: XMLStatus.initial,
        parsingStatus: ParsingXMLStatus.initial,
    file: null,
    fileWeb: null,
        fileName: null,
        xmlDocument: null,
        proxiesList: [],
        filterList: [],
        errorMex: null,
      );

  @override
  List<Object?> get props => [
        status,
    file,
    fileWeb,
        fileName,
        xmlDocument,
        parsingStatus,
        proxiesList,
        filterList,
        errorMex,
      ];
}
