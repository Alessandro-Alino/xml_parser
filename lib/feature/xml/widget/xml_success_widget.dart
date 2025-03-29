import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xml_parser/feature/xml/bloc/xml_bloc.dart';
import 'package:xml_parser/feature/xml/model/xml_model.dart';
import 'package:xml_parser/feature/xml/widget/xml_error_widget.dart';
import 'package:xml_parser/widget/app_snackbar.dart';

class XMLSuccessWidget extends StatelessWidget {
  const XMLSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<XMLBloc, XMLState>(listener: (context, state) {
        switch (state.exportStatus) {
          case ExportStatus.initial:
            break;
          case ExportStatus.success:
            context.appSnackBar(
              child: Text('Exporting Complete!'),
              icon: Icons.check,
            );
          case ExportStatus.loading:
            break;
          case ExportStatus.error:
            context.appSnackBar(
                child: Text('Error: ${state.errorMex}'),
                icon: Icons.close,
                isError: true);
        }
      }, builder: (context, state) {
        switch (state.parsingStatus) {
          case ParsingXMLStatus.initial:
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // Title File Selected
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 400.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('File selected:'),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('${state.fileName}'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Button start parsing
                    ActionChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Start parsing'),
                          const Icon(Icons.play_arrow),
                        ],
                      ),
                      onPressed: () {
                        context.read<XMLBloc>().parsingXML();
                      },
                    ),
                  ],
                ));
          case ParsingXMLStatus.loading:
            return Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CircularProgressIndicator.adaptive(),
            );
          case ParsingXMLStatus.error:
            return XmlErrorWidget(errorMex: '${state.errorMex}');
          case ParsingXMLStatus.success:
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Export
                    SizedBox(
                      height: 40.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          // Export Exel
                          ActionChip(
                            avatar: SvgPicture.asset('assets/svg/excel.svg'),
                            label: const Text('Export Exel'),
                            side: BorderSide(color: Colors.green),
                            color: WidgetStatePropertyAll(
                                Colors.green.withValues(alpha: 0.15)),
                            onPressed: () {
                              context
                                  .read<XMLBloc>()
                                  .exportExel(state.endpointList);
                            },
                          ),
                          const SizedBox(width: 12.0),
                          // Export Postman
                          ActionChip(
                            avatar: SvgPicture.asset('assets/svg/postman.svg'),
                            label: const Text('Export Postman'),
                            side: BorderSide(color: Colors.orange),
                            color: WidgetStatePropertyAll(
                                Colors.orange.withValues(alpha: 0.15)),
                            onPressed: () {
                              context
                                  .read<XMLBloc>()
                                  .exportPostman(state.endpointList);
                            },
                          ),
                        ],
                      ),
                    ),
                    // Filter Chips
                    Container(
                      height: 100.0,
                      margin: const EdgeInsets.only(top: 8.0),
                      child: Stack(
                        children: [
                          // Filter Chips
                          SizedBox(
                            height: 80.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                ...Method.values.map(
                                  (method) => Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: ActionChip(
                                      color: WidgetStatePropertyAll(
                                          method.color.withValues(alpha: 0.3)),
                                      label: Row(
                                        children: [
                                          // Method
                                          Text(
                                            method.name.toUpperCase(),
                                            style: TextStyle(
                                              color: method.color,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          // N. per Method
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0),
                                            child: Text(
                                              '- ${state.endpointList.where((e) => e.method == method).length}',
                                              style: TextStyle(
                                                color: method.color,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        context
                                            .read<XMLBloc>()
                                            .filterXML(method: method);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Reset Filter
                          Visibility(
                            visible: state.endpointList.length !=
                                state.filterList.length,
                            child: Positioned(
                              bottom: 5.0,
                              left: 0.0,
                              child: TextButton(
                                onPressed: () {
                                  context
                                      .read<XMLBloc>()
                                      .filterXML(reset: true);
                                },
                                child: const Text('Reset'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Title
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('List of proxies:',
                              style: Theme.of(context).textTheme.titleMedium),
                          Text('Total API: ${state.filterList.length}',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                    // List of Proxies
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.filterList.length,
                        itemBuilder: (context, index) {
                          XMLModel endpoint = state.filterList[index];
                          return Card(
                            elevation: 0.0,
                            color: endpoint.method.color.withValues(alpha: 0.3),
                            child: ListTile(
                              title: Text(endpoint.api),
                              trailing: Text(
                                endpoint.method.name.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: endpoint.method.color,
                                ),
                              ),
                            ),
                          );
                        }),
                    const SizedBox(height: 80.0),
                  ],
                ),
              ),
            );
        }
      }),
    );
  }
}
