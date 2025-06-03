import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';
import 'package:xml/xml.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xml_parser/feature/xml/model/xml_model.dart';

part 'xml_event.dart';

part 'xml_state.dart';

part 'xml_bloc.freezed.dart';

class XMLBloc extends Bloc<XMLEvent, XMLState> {
  XMLBloc() : super(XMLState.initState()) {
    on<_InitXMLEvent>((event, emit) => _init(event, emit));
    on<_SelectXMLEvent>((event, emit) async => await _selectXML(event, emit));
    on<_ParsingXMLEvent>((event, emit) async => await _parsingXML(event, emit));
    on<_FilterXMLEvent>((event, emit) =>
        _filterPerMethod(event, emit, event.method, event.reset));
    on<_XMLtoExelEvent>(
        (event, emit) async => await _exportExel(event, emit, event.apiList));
    on<_ExportPostmanEvent>((event, emit) async =>
        await _exportPostman(event, emit, event.apiList));
    on<_OnDropEvent>(
        (event, emit) => _onDropHover(event, emit, event.isDropping));
    on<_OnPerformDropEvent>((event, emit) async =>
        await _onPerformDrop(event, emit, event.dropEvent));
  }

  //-----v-----//
  void init() => add(_InitXMLEvent());

  void selectXML() => add(_SelectXMLEvent());

  void parsingXML() => add(_ParsingXMLEvent());

  void filterXML({Method? method, bool? reset}) => add(_FilterXMLEvent(
        method: method,
        reset: reset,
      ));

  void exportExel(List<XMLModel> apiList) =>
      add(_XMLtoExelEvent(apiList: apiList));

  void exportPostman(List<XMLModel> apiList) =>
      add(_ExportPostmanEvent(apiList: apiList));

  void onDragHover(bool isDropping) =>
      add(_OnDropEvent(isDropping: isDropping));

  Future<void> onPerformDrop(PerformDropEvent dropEvent) async =>
      add(_OnPerformDropEvent(dropEvent: dropEvent));

  //_____^_____//

  // Init
  void _init(XMLEvent event, Emitter<XMLState> emit) {
    emit(XMLState.initState());
  }

  // Select XML from platform
  Future<void> _selectXML(XMLEvent event, Emitter<XMLState> emit) async {
    emit(state.copyWith(status: XMLStatus.loading));
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xml'],
      );
      if (result != null && result.files.isNotEmpty) {
        // For web
        if (kIsWeb) {
          if (result.files.first.bytes != null) {
            Uint8List fileBytes = result.files.first.bytes!;
            emit(state.copyWith(
              status: XMLStatus.success,
              fileWeb: fileBytes,
              fileName: result.files.first.name,
            ));
          } else {
            emit(state.copyWith(
              status: XMLStatus.error,
              errorMex: 'File path is invalid',
            ));
          }
        }
        // Native Platform
        else {
          // Check if the path is not null
          if (result.files.single.path != null) {
            File file = File(result.files.single.path!);
            emit(state.copyWith(
              status: XMLStatus.success,
              file: file,
              fileName: result.files.first.name,
            ));
          } else {
            emit(state.copyWith(
              status: XMLStatus.error,
              errorMex: 'File path is invalid',
            ));
          }
        }
      } else {
        emit(state.copyWith(
          status: XMLStatus.error,
          errorMex: 'No file selected',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: XMLStatus.error,
        errorMex: 'Error to pick the file.',
      ));
    }
  }

  void _onDropHover(XMLEvent event, Emitter<XMLState> emit, bool isDropping) {
    emit(state.copyWith(isDropping: isDropping));
  }

  Future<File?> getFileFromReader(DropItem item, File? fileSelected) async {
    final Completer<File?> completer = Completer();
    if (item.dataReader == null) {
      log('Data reader is null');
      return null;
    }

    // Only for Desktop Version
    if (item.dataReader!.canProvide(Formats.fileUri)) {
      item.dataReader!.getValue(Formats.fileUri, (value) {
        if (value != null) {
          fileSelected = File.fromUri(value);
          completer.complete(fileSelected);
        }
      }, onError: (error) {
        completer.complete(null);
      });
    } else {
      log('Can\'t provide FileURI.');
    }
    return completer.future;
  }

  Future<void> _onPerformDrop(
    XMLEvent event,
    Emitter<XMLState> emit,
    PerformDropEvent dropEvent,
  ) async {
    if (dropEvent.session.items.isEmpty) {
      log('No items in drop session');
      return;
    }

    final DropItem item = dropEvent.session.items.first;
    File? fileSelected;

    fileSelected = await getFileFromReader(item, fileSelected);

    if (fileSelected != null) {
      if (kIsWeb) {
        Uint8List fileBytes = await fileSelected.readAsBytes();
        emit(state.copyWith(
          status: XMLStatus.success,
          fileWeb: fileBytes,
          fileName: fileSelected.path.toString().split('\\').last,
        ));
      } // Native Platform
      else {
        emit(state.copyWith(
          status: XMLStatus.success,
          file: fileSelected,
          fileName: fileSelected.path.toString().split('\\').last,
        ));
      }
    } else {
      emit(state.copyWith(
        status: XMLStatus.error,
        errorMex: 'File not Allowed',
      ));
    }
  }

  // Parsing the XML selected
  Future<void> _parsingXML(XMLEvent event, Emitter<XMLState> emit) async {
    if (state.file != null || state.fileWeb != null) {
      emit(state.copyWith(parsingStatus: ParsingXMLStatus.loading));
      final List<XMLModel> endpointList = [];
      final String fileContents;
      try {
        if (kIsWeb) {
          fileContents = utf8.decode(state.fileWeb!);
        } else {
          fileContents = await state.file!.readAsString();
        }
        final XmlDocument xmlDocument = XmlDocument.parse(fileContents);

        // BasePath
        final String basepath =
            xmlDocument.findAllElements('BasePath').first.innerXml;

        // Trova l'elemento Flows
        final flowsElement = xmlDocument
            .findElements('ProxyEndpoint')
            .firstWhere((e) => true)
            .findElements('Flows')
            .firstWhere((e) => true);

        // Itera su tutti i Flow
        for (final flow in flowsElement.findElements('Flow')) {
          final conditionElements = flow.findAllElements('Condition');
          if (conditionElements.isEmpty ||
              conditionElements.first.children.isEmpty) {
            continue;
          }
          // Leggi il contenuto del Tag <Condition>
          final condition = conditionElements.first.children.first.outerXml;
          if (condition.contains('proxy.pathsuffix')) {
            List<XMLModel> proxies = extractApiAndMethods(condition);
            endpointList.addAll(proxies);
          }
        }
        emit(state.copyWith(
          parsingStatus: ParsingXMLStatus.success,
          xmlDocument: xmlDocument,
          endpointList: endpointList,
          filterList: endpointList,
          basepath: basepath,
        ));
      } catch (e) {
        emit(state.copyWith(
          parsingStatus: ParsingXMLStatus.error,
          errorMex: 'Parsing Error: $e',
          endpointList: [],
          filterList: [],
        ));
      }
    } else {
      emit(
        state.copyWith(
          parsingStatus: ParsingXMLStatus.error,
          errorMex: 'File XML invalid',
          endpointList: [],
          filterList: [],
        ),
      );
    }
  }

  // Filter per Method
  void _filterPerMethod(
      XMLEvent event, Emitter<XMLState> emit, Method? method, bool? reset) {
    if (reset != null && reset) {
      emit(state.copyWith(filterList: state.endpointList));
    } else {
      List<XMLModel> filterList =
          state.endpointList.where((proxy) => proxy.method == method).toList();
      emit(state.copyWith(filterList: filterList));
    }
  }

  // Export list of API in Exel table
  Future<void> _exportExel(
    XMLEvent event,
    Emitter<XMLState> emit,
    List<XMLModel> apiList,
  ) async {
    // Create a new Excel document
    final excel = Excel.createExcel();

    // Get the default sheet
    final Sheet sheet = excel[excel.getDefaultSheet()!];

    // Define headers
    final List<CellValue> headers = [
      TextCellValue('APPLICATION'),
      TextCellValue('API'),
      TextCellValue('METHOD'),
    ];

    final CellStyle cellStyle = CellStyle(
      horizontalAlign: HorizontalAlign.Center,
      verticalAlign: VerticalAlign.Center,
      topBorder: Border(borderStyle: BorderStyle.Thin),
      rightBorder: Border(borderStyle: BorderStyle.Thin),
      bottomBorder: Border(borderStyle: BorderStyle.Thin),
      leftBorder: Border(borderStyle: BorderStyle.Thin),
    );

    // Write headers
    for (var i = 0; i < headers.length; i++) {
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0))
        ..value = headers[i]
        ..cellStyle = cellStyle.copyWith(boldVal: true, fontSizeVal: 12);

      // Auto-fit columns
      sheet.setColumnAutoFit(i);
    }

    // Write Rows
    for (var i = 0; i < apiList.length; i++) {
      // Application
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i + 1))
        ..value = TextCellValue(
          state.xmlDocument!
              .findAllElements('BasePath')
              .first
              .innerText
              .replaceAll('/', ''),
        )
        ..cellStyle = cellStyle;
      // Api
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i + 1))
        ..value = TextCellValue(apiList[i].api)
        ..cellStyle = cellStyle;
      //Method
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: i + 1))
        ..value = TextCellValue(apiList[i].method.name.toUpperCase())
        ..cellStyle = cellStyle;
    }
    // Merge cells in the first column
    sheet
      ..merge(
        CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 1),
        CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: apiList.length),
      )
      ..setMergedCellStyle(
        CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 1),
        cellStyle,
      );

    // Filename
    final String fileName = '${state.fileName!.substring(
      0,
      state.fileName!.lastIndexOf('.'),
    )}.xlsx';

    emit(state.copyWith(exportStatus: ExportStatus.loading));
    try {
      // For Flutter Web auto-start download
      final List<int> fileBytes = excel.save(fileName: fileName)!;

      // For all other platforms
      if (!kIsWeb) {
        final Directory? directory = await getDownloadsDirectory();

        File(join('${directory!.path}/$fileName'))
          ..createSync(recursive: true)
          ..writeAsBytesSync(fileBytes);
      }
      emit(state.copyWith(exportStatus: ExportStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          errorMex: 'Error exporting in Exel: $e',
          exportStatus: ExportStatus.error,
        ),
      );
    }
    emit(state.copyWith(exportStatus: ExportStatus.initial));
  }

// Export in Postman Collection
  Future<void> _exportPostman(
    XMLEvent event,
    Emitter<XMLState> emit,
    List<XMLModel> apiList,
  ) async {
    final postmanCollection = {
      "info": {
        "name": "Import_API",
        "schema":
            "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
      },
      "item": [
        {
          "name": "Test 1",
          "item": apiList.map((e) {
            return {
              "name": e.api.replaceAll('*', '{id}'),
              "request": {
                "method": e.method.name.toUpperCase(),
                "header": [],
                "url": {
                  "raw": "{{hostname}}${state.basepath}${e.api}",
                  "protocol": "https",
                  "host": ["{{hostname}}"],
                  "path": [
                    state.basepath,
                    ...e.api.split('/').where((e) => e.isNotEmpty)
                  ]
                },
              },
              "response": [],
            };
          }).toList()
        }
      ]
    };

    final content = jsonEncode(postmanCollection);
    if (!kIsWeb) {
      emit(state.copyWith(exportStatus: ExportStatus.loading));
      final directory = await getDownloadsDirectory();
      if (directory != null) {
        // Download FILE from Native Platform
        final file = File('${directory.path}/postman_collection.json');
        await file.writeAsString(content);
        emit(state.copyWith(exportStatus: ExportStatus.success));
      } else {
        emit(state.copyWith(
          exportStatus: ExportStatus.error,
          errorMex: 'Error to Export the file. Retry.',
        ));
      }
    } else {
      emit(state.copyWith(
        exportStatus: ExportStatus.error,
        errorMex: 'Export Postman from WEB? Coming soon... 🙃',
      ));
    }
    emit(state.copyWith(exportStatus: ExportStatus.initial));
  }
}

// Extract the APIs and Methods
List<XMLModel> extractApiAndMethods(String input) {
  final List<XMLModel> results = [];

  // Regex to match the path
  final RegExp apiRegex = RegExp(r'MatchesPath\s*"([^"]+)"');
  final RegExpMatch? apiMatch = apiRegex.firstMatch(input);

  // Regex to match the HTTP method(s) - supporta sia = che JavaRegex
  final RegExp methodRegex =
      RegExp(r'request\.verb\s+(?:=|JavaRegex)\s*"([^"]+)"');
  final RegExpMatch? methodMatch = methodRegex.firstMatch(input);

  // Extract values if both matches are found
  final String? api = apiMatch?.group(1);
  final String? methodString = methodMatch?.group(1);

  if (api == null || methodString == null) {
    return results;
  }
  final methods = methodString.split('|');

  for (final methodStr in methods) {
    try {
      final method = Method.values.firstWhere(
        (e) => e.name.toUpperCase() == methodStr.trim().toUpperCase(),
      );

      results.add(XMLModel(api: api, method: method));
    } catch (e) {
      continue;
    }
  }

  return results;
}
