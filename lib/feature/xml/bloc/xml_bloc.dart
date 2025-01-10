import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:xml/xml.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xml_parser/feature/xml/model/xml_model.dart';

part 'xml_event.dart';

part 'xml_state.dart';

class XMLBloc extends Bloc<XMLEvent, XMLState> {
  XMLBloc() : super(XMLState.initState()) {
    on<InitXMLEvent>((event, emit) async => await _init(event, emit));
    on<SelectXMLEvent>((event, emit) async => await _selectXML(event, emit));
    on<ParsingXMLEvent>((event, emit) async => await _parsingXML(event, emit));
    on<FilterXMLEvent>((event, emit) async =>
        await _filterPerMethod(event, emit, event.method, event.reset));
  }

  //_____v_____//
  init() => add(InitXMLEvent());

  selectXML() => add(SelectXMLEvent());

  parsingXML() => add(ParsingXMLEvent());

  filterXML(Method method, {bool? reset}) => add(FilterXMLEvent(
        method: method,
        reset: reset,
      ));

  //_____^_____//

  // Init
  _init(XMLEvent event, Emitter<XMLState> emit) {
    emit(XMLState.initState());
  }

  // Select XML from platform
  Future<void> _selectXML(XMLEvent event, Emitter<XMLState> emit) async {
    emit(state.copyWith(status: XMLStatus.loading));
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      // Only for web
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
      // Other platform (Android, iOS, MacOS, Linux, Windows)
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
  }

  // Parsing the XML selected
  Future<void> _parsingXML(XMLEvent event, Emitter<XMLState> emit) async {
    if (state.file != null || state.fileWeb!=null) {
      emit(state.copyWith(parsingStatus: ParsingXMLStatus.loading));
      final List<XMLModel> proxiesList = [];
      final String fileContents;
      try {
        if (kIsWeb) {
          fileContents = utf8.decode(state.fileWeb!);
        } else {
          fileContents = await state.file!.readAsString();
        }
        final XmlDocument xmlDocument = XmlDocument.parse(fileContents);
        // Proxies List
        proxiesList.addAll(
          xmlDocument
              .findAllElements('Condition')
              .where((node) => node.innerXml.startsWith('(proxy.pathsuffix'))
              .map((e) {
            XMLModel proxy = extractApiAndMethod(e.innerXml);
            return proxy;
          }),
        );
        emit(state.copyWith(
          parsingStatus: ParsingXMLStatus.success,
          xmlDocument: xmlDocument,
          proxiesList: proxiesList,
          filterList: proxiesList,
        ));
      } catch (e) {
        emit(state.copyWith(
          parsingStatus: ParsingXMLStatus.error,
          errorMex: 'Parsing Error: $e',
          proxiesList: [],
          filterList: [],
        ));
      }
    } else {
      emit(
        state.copyWith(
          parsingStatus: ParsingXMLStatus.error,
          errorMex: 'File XML invalid',
          proxiesList: [],
          filterList: [],
        ),
      );
    }
  }

  // Filter per Method
  _filterPerMethod(
      XMLEvent event, Emitter<XMLState> emit, Method method, bool? reset) {
    if (reset != null && reset) {
      emit(state.copyWith(filterList: state.proxiesList));
    } else {
      List<XMLModel> filterList = state.proxiesList
          .where(
            (proxy) => proxy.method == method,
          )
          .toList();
      emit(state.copyWith(filterList: filterList));
    }
  }

  // Extract the API and Method
  XMLModel extractApiAndMethod(String input) {
    // Regex to match the path
    final RegExp apiRegex = RegExp(r'MatchesPath\s*"([^"]+)"');
    final RegExpMatch? apiMatch = apiRegex.firstMatch(input);

    // Regex to match the HTTP method
    final RegExp methodRegex = RegExp(r'request\.verb\s*=\s*"([^"]+)"');
    final RegExpMatch? methodMatch = methodRegex.firstMatch(input);

    // Extract values if both matches are found
    final String? api = apiMatch?.group(1);
    final String? methodString = methodMatch?.group(1);

    Method method = Method.values.singleWhere((e) => e.name == methodString);

    return XMLModel(api: api, method: method);
  }
}
