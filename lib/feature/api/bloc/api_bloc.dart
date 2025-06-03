import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_event.dart';

part 'api_state.dart';

part 'api_bloc.freezed.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(const ApiState.initial()) {
    on<_InitEvent>((event, emit) => _init(event, emit));
    on<_GenerateApiEvent>((event, emit) => _onConvertApiLines(
          event,
          emit,
          event.input,
        ));
  }

  //-----v-----//
  void init() => add(_InitEvent());

  void generateApi({required String input}) =>
      add(_GenerateApiEvent(input: input));

  //-----^-----//
  // _Init
  void _init(ApiEvent event, Emitter<ApiState> emit) {
    emit(const ApiState.initial());
  }

  // _OnConvertApiLines
  void _onConvertApiLines(
      ApiEvent event, Emitter<ApiState> emit, String input) {
    emit(LoadingState());

    try {
      final result = _generateApi(input);
      emit(SuccessState(generatedApi: result));
    } catch (e) {
      emit(ErrorState(
        errorMex: 'Errore durante la conversione: ${e.toString()}',
      ));
    }
  }

  // _GenerateApi
  String _generateApi(String input) {
    final lines =
        input.split('\n').where((line) => line.trim().isNotEmpty).toList();
    final xmlResults = <String>[];

    for (final line in lines) {
      final xmlFlow = _parseLineToXml(line.trim());
      if (xmlFlow.isNotEmpty) {
        xmlResults.add(xmlFlow);
      }
    }

    return xmlResults.join('\n');
  }

  // _ParseLineToXml
  String _parseLineToXml(String line) {
    final parts = line.split(RegExp(r'\s+'));
    if (parts.length < 2) return '';

    String method = '';
    String path = '';

    if (_isHttpMethod(parts[0])) {
      method = parts[0];
      path = parts.sublist(1).join(' ');
    } else if (parts.length >= 2 && _isHttpMethod(parts.last)) {
      method = parts.last;
      path = parts.sublist(0, parts.length - 1).join(' ');
    } else {
      method = parts.last;
      path = parts.sublist(0, parts.length - 1).join(' ');
    }

    final nameValue = _replacePathParams(path, 'id');

    final conditionPath = _replacePathParams(path, '*');

    return _buildXmlFlow(nameValue, conditionPath, method.toUpperCase());
  }

  // _IsHttpMethod
  bool _isHttpMethod(String value) {
    const httpMethods = [
      'GET',
      'POST',
      'PUT',
      'DELETE',
      'PATCH',
      'HEAD',
      'OPTIONS'
    ];
    return httpMethods.contains(value.toUpperCase());
  }

  // _ReplacePathParams
  String _replacePathParams(String path, String replacement) {
    if (replacement == '*') {
      return path.replaceAll(RegExp(r'\{[^}]*\}'), '*');
    } else {
      return path.replaceAll(RegExp(r'\{[^}]*\}'), '{$replacement}');
    }
  }

  // _BuildXmlFlow
  String _buildXmlFlow(String nameValue, String conditionPath, String method) {
    return '''    <Flow name="$nameValue">
        <Description/>
        <Request/>
        <Response/>
        <Condition>(proxy.pathsuffix MatchesPath "$conditionPath") and (request.verb = "$method") and (organization.name == "ucs-us-g4c-pez-hvpc-01" or organization.name == "ucs-g4c-dmz-003-apigee-uat")</Condition>
    </Flow>''';
  }
}
