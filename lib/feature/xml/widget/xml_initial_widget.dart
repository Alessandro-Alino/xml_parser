import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';
import 'package:xml_parser/feature/xml/bloc/xml_bloc.dart';

class XmlInitialWidget extends StatelessWidget {
  const XmlInitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<XMLBloc, XMLState>(
      builder: (context, state) {
        return Column(
          children: [
            //Button Select
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ActionChip(
                    label: const Text('Select XML File'),
                    onPressed: () {
                      context.read<XMLBloc>().selectXML();
                    },
                  ),
                ],
              ),
            ),
            // Drop Area
            Visibility(
              visible: !kIsWeb,
              child: DropRegion(
                formats: const [Formats.fileUri],
                onDropOver: (event) => DropOperation.copy,
                onDropEnter: (_) => context.read<XMLBloc>().onDragHover(true),
                onDropLeave: (_) => context.read<XMLBloc>().onDragHover(false),
                onPerformDrop: (event) async =>
                    await context.read<XMLBloc>().onPerformDrop(event),
                child: Container(
                  width: 300,
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                        state.isDropping ? Colors.blue.shade100 : Colors.white,
                    border: Border.all(
                        color: state.isDropping
                            ? Colors.blue.shade700
                            : Colors.blue,
                        width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: state.file != null
                      ? Text(
                          'Dropped File: ${state.file!.path.split('/').last}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        )
                      : const Text(
                          'Drop File Here',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
