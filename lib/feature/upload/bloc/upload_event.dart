part of 'upload_bloc.dart';

@freezed
sealed class UploadEvent with _$UploadEvent {
  const factory UploadEvent.init() = _InitEvent;

  const factory UploadEvent.pickFile() = _PickFileEvent;

  const factory UploadEvent.uploadFile(
      {required String filePath,
      Uint8List? fileWeb,
      required String fileName}) = _UploadFileEvent;
}
