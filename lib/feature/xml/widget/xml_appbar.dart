import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xml_parser/feature/xml/bloc/xml_bloc.dart';

class XMLAppBar extends StatelessWidget {
  const XMLAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Row(
        children: [
          BlocBuilder<XMLBloc, XMLState>(
            builder: (context, state) {
              return Visibility(
                visible: context.read<XMLBloc>().state.xmlDocument != null,
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        showDragHandle: true,
                        context: context,
                        builder: (context) {
                          return DraggableScrollableSheet(
                              expand: false,
                              minChildSize: 0.3,
                              maxChildSize: 0.9,
                              initialChildSize: 0.7,
                              builder: (context, controller) {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SingleChildScrollView(
                                    controller: controller,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 32.0,
                                          ),
                                          child: SelectableText(
                                            context
                                                .read<XMLBloc>()
                                                .state
                                                .xmlDocument!
                                                .toXmlString(
                                                  pretty: true,
                                                ),
                                          ),
                                        ),

                                        ///...context
                                        //   .read<XMLBloc>()
                                        //   .state
                                        //   .xmlDocument!
                                        //   .children
                                        //   .map(
                                        // (e) => ListTile(
                                        //     title: SelectableText('$e')),
                                        //  ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        });
                  },
                  icon: Icon(Icons.view_timeline_rounded),
                ),
              );
            },
          ),
          // Init XML
          IconButton(
            onPressed: () {
              context.read<XMLBloc>().init();
            },
            icon: Icon(Icons.refresh_outlined),
          ),
        ],
      ),
    );
  }
}
