import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xml_parser/feature/upload/repo/upload_repo.dart';

part 'upload_event.dart';

part 'upload_state.dart';

part 'upload_bloc.freezed.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  final UploadRepo uploadRepo;

  UploadBloc(this.uploadRepo) : super(const UploadState.initial()) {
    on<_InitEvent>((event, emit) => _init(event, emit));
    on<_PickFileEvent>((event, emit) => _onPickFile(event, emit));
    on<_UploadFileEvent>((event, emit) => _uploadFile(
        event, emit, event.filePath, event.fileWeb, event.fileName));
  }

  //-----v-----//
  init() => add(_InitEvent());

  pickFile() => add(_PickFileEvent());

  uploadFile(
          {required String filePath,
          Uint8List? fileWeb,
          required String fileName}) =>
      add(_UploadFileEvent(
          filePath: filePath, fileWeb: fileWeb, fileName: fileName));

  //-----^-----//

  // Select File to upload on Supabase
  Future<void> _onPickFile(UploadEvent event, Emitter<UploadState> emit) async {
    emit(const UploadState.loading());
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null && result.files.isNotEmpty) {
        // For web
        if (kIsWeb) {
          if (result.files.first.bytes != null) {
            Uint8List fileBytes = result.files.first.bytes!;
            emit(UploadState.selected(
              file: File.fromRawPath(fileBytes),
              fileWeb: fileBytes,
              fileName: result.files.first.name,
            ));
          } else {
            //Emit error
          }
        }
        // Native Platform
        else {
          // Check if the path is not null
          if (result.files.single.path != null) {
            File file = File(result.files.single.path!);
            emit(UploadState.selected(
              file: file,
              fileName: result.files.first.name,
            ));
          } else {
            //Emit error
          }
        }
      } else {
        init();
      }
    } catch (e) {
      emit(UploadState.error(
          'BLOC: Errore durante la selezione del file: ${e.toString()}'));
    }
  }

  //Upload File
  Future<void> _uploadFile(UploadEvent event, Emitter<UploadState> emit,
      String filePath, Uint8List? fileWeb, String fileName) async {
    emit(const UploadState.loading());
    try {
      // For web
      if (kIsWeb) {
        Uint8List uint8List = fileWeb!;
        await uploadRepo.uploadBytes(uint8List, fileName);
        emit(const UploadState.uploaded());
        await Future.delayed(const Duration(seconds: 1), () {
          emit(const UploadState.initial());
        });
      }
      // Native Platform
      else {
        await uploadRepo.uploadFile(filePath, fileName);
        emit(const UploadState.uploaded());
        await Future.delayed(const Duration(seconds: 1), () {
          emit(const UploadState.initial());
        });
      }
    } catch (e) {
      emit(UploadState.error(
          'BLOC: Errore durante l\'upload del file: ${e.toString()}'));
    }
  }

  void _init(UploadEvent event, Emitter<UploadState> emit) {
    emit(const UploadState.initial());
  }
}
