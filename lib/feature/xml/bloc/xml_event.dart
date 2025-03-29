part of 'xml_bloc.dart';

@freezed
sealed class XMLEvent with _$XMLEvent {
  const factory XMLEvent.initXML() = _InitXMLEvent;

  const factory XMLEvent.selectXML() = _SelectXMLEvent;

  const factory XMLEvent.parsingXML() = _ParsingXMLEvent;

  const factory XMLEvent.filterXML({
    final Method? method,
    final bool? reset,
  }) = _FilterXMLEvent;

  const factory XMLEvent.xmlToExel({
    required List<XMLModel> apiList,
  }) = _XMLtoExelEvent;

  const factory XMLEvent.exportPostman({
    required List<XMLModel> apiList,
  }) = _ExportPostmanEvent;

  const factory XMLEvent.onDropEvent({
    required bool isDropping,
  }) = _OnDropEvent;

  const factory XMLEvent.onPerformDropEvent({
    required PerformDropEvent dropEvent,
  }) = _OnPerformDropEvent;
}
