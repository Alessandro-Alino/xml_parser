import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xml_parser/feature/xml/bloc/xml_bloc.dart';
import 'package:xml_parser/feature/xml/widget/xml_appbar.dart';
import 'package:xml_parser/feature/xml/widget/xml_error_widget.dart';
import 'package:xml_parser/feature/xml/widget/xml_initial_widget.dart';
import 'package:xml_parser/feature/xml/widget/xml_success_widget.dart';

class XmlPage extends StatelessWidget {
  const XmlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('XML Parsing'),
          pinned: true,
          actions: [
            XMLAppBar(),
          ],
        ),
        SliverToBoxAdapter(
          child: BlocConsumer<XMLBloc, XMLState>(
              listener: (context, state) {},
              builder: (context, state) {
                switch (state.status) {
                  case XMLStatus.initial:
                    return XmlInitialWidget();
                  case XMLStatus.loading:
                    return Center(child: CircularProgressIndicator.adaptive());
                  case XMLStatus.error:
                    return XmlErrorWidget(errorMex: '${state.errorMex}');
                  case XMLStatus.success:
                    return XMLSuccessWidget();
                }
              }),
        ),
      ],
    );
  }
}
