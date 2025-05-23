import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xml_parser/feature/upload/bloc/upload_bloc.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<UploadBloc, UploadState>(
        builder: (context, state) {
          return switch (state) {
            InitialState() => ActionChip(
                label: const Text('Seleziona file'),
                onPressed: () {
                  context.read<UploadBloc>().pickFile();
                },
              ),
            LoadingState() =>
              Center(child: const CircularProgressIndicator.adaptive()),
            SelectedState(:final file, :final fileWeb, :final fileName) =>
              Column(
                spacing: 16.0,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('File selezionato: '),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(fileName),
                        ),
                      ),
                    ],
                  ),
                  ActionChip(
                    label: const Text('Carica'),
                    onPressed: () {
                      context.read<UploadBloc>().uploadFile(
                          filePath: file.path,
                          fileWeb: fileWeb,
                          fileName: fileName);
                    },
                  ),
                ],
              ),
            ErrorState(:final errMex) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 48),
                  SelectableText('Errore: $errMex',
                      style: const TextStyle(color: Colors.red)),
                ],
              ),
            UploadedState() => Center(
                child: const Icon(Icons.check_circle,
                    color: Colors.green, size: 48),
              ),
          };
        },
      ),
    );
  }
}
