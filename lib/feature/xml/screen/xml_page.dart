import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xml_parser/feature/xml/bloc/xml_bloc.dart';
import 'package:xml_parser/feature/xml/widget/xml_appbar.dart';
import 'package:xml_parser/feature/xml/widget/xml_success_widget.dart';

class XmlPage extends StatelessWidget {
  const XmlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('XML Parsing'),
        actions: [
          XMLAppBar(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Button to pick the XML File
            Row(
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
            // Content
            BlocConsumer<XMLBloc, XMLState>(
                listener: (context, state) {},
                builder: (context, state) {
                  switch (state.status) {
                    case XMLStatus.initial:
                      return SizedBox.shrink();
                    case XMLStatus.loading:
                      return CircularProgressIndicator.adaptive();
                    case XMLStatus.error:
                      return Center(
                        child: Text('Error. Retry!'),
                      );
                    case XMLStatus.success:
                      return XMLSuccessWidget();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
