import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xml_parser/feature/api/bloc/api_bloc.dart';
import 'package:xml_parser/widget/app_snackbar.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.amber.shade200,
              ),
              child: TextFormField(
                  maxLines: 10,
                  controller: _textController,
                  decoration: InputDecoration(
                      hintText: 'Inserisci il testo qui...',
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Non può essere vuoto.';
                    }
                    return null;
                  }),
            ),
          ),
        ),
        // Generate API
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ActionChip(
              avatar: Icon(Icons.arrow_downward),
              label: const Text('Generate API'),
              onPressed: () {
                if (_textController.text.isEmpty) {
                  context.appSnackBar(
                    child: const Text('Dai su 😒'),
                    icon: Icons.close,
                    isError: true,
                  );
                } else {
                  context
                      .read<ApiBloc>()
                      .generateApi(input: _textController.text);
                }
              },
            ),
          ],
        ),
        // Response
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.amber.shade200,
              ),
              child: BlocBuilder<ApiBloc, ApiState>(builder: (context, state) {
                switch (state) {
                  case LoadingState():
                    return Center(
                      child: const CircularProgressIndicator.adaptive(),
                    );
                  case SuccessState(:final generatedApi):
                    return Stack(children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SelectableText(generatedApi),
                      ),
                      Positioned(
                        top: 10.0,
                        right: 5.0,
                        child: IconButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: generatedApi))
                                .then((_) {
                              if (context.mounted) {
                                context.appSnackBar(
                                  child: const Text('Copied to Clipboard'),
                                  icon: Icons.copy,
                                );
                              }
                            });
                          },
                          icon: Icon(Icons.copy),
                        ),
                      ),
                    ]);
                  case ErrorState(:final errorMex):
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SelectableText('Errore: $errorMex'),
                    );
                  default:
                    return const SizedBox.expand();
                }
              }),
            ),
          ),
        ),
      ],
    );
  }
}
