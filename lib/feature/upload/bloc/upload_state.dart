part of 'upload_bloc.dart';

@freezed
sealed class UploadState with _$UploadState {
  const factory UploadState.initial() = InitialState;

  const factory UploadState.loading() = LoadingState;

  const factory UploadState.selected(
      {required File file, Uint8List? fileWeb, required String fileName}) = SelectedState;

  const factory UploadState.uploaded() = UploadedState;

  const factory UploadState.error(String errMex) = ErrorState;
}
