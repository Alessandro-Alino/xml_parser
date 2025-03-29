import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xml_parser/feature/xml/bloc/xml_bloc.dart';

class XmlErrorWidget extends StatelessWidget {
  const XmlErrorWidget({super.key, required this.errorMex});

  final String errorMex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(errorMex),
        TextButton(
          onPressed: () {
            context.read<XMLBloc>().init();
          },
          child: const Text('Restart'),
        )
      ],
    );
  }
}
