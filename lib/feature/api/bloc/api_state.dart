part of 'api_bloc.dart';

@freezed
class ApiState with _$ApiState {
  const factory ApiState.initial() = InitialState;
  const factory ApiState.loading() = LoadingState;
  const factory ApiState.success({required String generatedApi}) = SuccessState;
  const factory ApiState.error({required String errorMex}) = ErrorState;
}
