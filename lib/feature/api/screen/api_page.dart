import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xml_parser/feature/api/bloc/api_bloc.dart';

class ApiPage extends StatefulWidget {  const ApiPage({super.key});

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
              ),
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
                if (_textController.text.isNotEmpty) {
                  // context
                  //     .read<ApiBloc>()
                  //     .generateAPI(api: _textController.text);
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
                return SizedBox();
                // switch (state) {
                //   case InitialState():
                //     return const SizedBox.expand();
                //   case LoadingState():
                //     return Center(
                //       child: const CircularProgressIndicator.adaptive(),
                //     );
                //   case SuccessState():
                //     return Stack(children: [
                //       SelectableText(state.api),
                //       Positioned(
                //         top: 10.0,
                //         right: 5.0,
                //         child: IconButton(
                //           onPressed: () {
                //             Clipboard.setData(ClipboardData(text: state.api))
                //                 .then((_) {
                //               if (context.mounted) {
                //                 context.appSnackBar(
                //                     child: const Text('Copied to Clipboard'),
                //                     icon: Icons.check);
                //               }
                //             });
                //           },
                //           icon: Icon(Icons.copy),
                //         ),
                //       ),
                //     ]);
                //   case ErrorState():
                //     return Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: SelectableText('Errore: ${state.e}'),
                //     );
                // }
              }),
            ),
          ),
        ),
      ],
    );
  }
}
