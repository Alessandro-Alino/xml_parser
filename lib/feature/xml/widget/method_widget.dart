import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xml_parser/feature/xml/bloc/xml_bloc.dart';
import 'package:xml_parser/feature/xml/model/xml_model.dart';

class MethodWidget extends StatelessWidget {
  const MethodWidget({super.key, required this.method});

  final Method method;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ActionChip(
        color: WidgetStatePropertyAll(method.color.withValues(alpha: 0.3)),
        label: Row(
          children: [
            // Method
            Stack(
              children: [
                Text(
                  method.name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1.5
                      ..color = Colors.black54,
                  ),
                ),
                Text(
                  method.name,
                  style: TextStyle(
                    color: method.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            // N. for Method
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: BlocBuilder<XMLBloc, XMLState>(
                builder: (context, state) {
                  return Text('${state.endpointList.where(
                        (proxy) => proxy.method == method,
                      ).length}');
                },
              ),
            ),
          ],
        ),
        onPressed: () {
          context.read<XMLBloc>().filterXML(method: method);
        },
      ),
    );
  }
}
