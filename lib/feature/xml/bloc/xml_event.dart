part of 'xml_bloc.dart';

abstract class XMLEvent extends Equatable {}

class InitXMLEvent extends XMLEvent {
  @override
  List<Object?> get props => [];
}

class SelectXMLEvent extends XMLEvent {
  @override
  List<Object?> get props => [];
}

class ParsingXMLEvent extends XMLEvent {
  @override
  List<Object?> get props => [];
}

class FilterXMLEvent extends XMLEvent {
  FilterXMLEvent({required this.method, this.reset});

  final Method method;
  final bool? reset;

  @override
  List<Object?> get props => [method, reset];
}

class ExportExelEvent extends XMLEvent {
  ExportExelEvent({required this.apiList});

  final List<XMLModel> apiList;

  @override
  List<Object?> get props => [apiList];
}
