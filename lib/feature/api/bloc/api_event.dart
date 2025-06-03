part of 'api_bloc.dart';

@freezed
class ApiEvent with _$ApiEvent {
  const factory ApiEvent.init() = _InitEvent;
  const factory ApiEvent.generateApi({required String input}) = _GenerateApiEvent;
}
