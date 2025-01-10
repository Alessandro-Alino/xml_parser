import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xml_parser/feature/xml/bloc/xml_bloc.dart';
import 'package:xml_parser/feature/xml/model/xml_model.dart';

class XMLSuccessWidget extends StatelessWidget {
  const XMLSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<XMLBloc, XMLState>(
        listener: (context, state) {},
        builder: (context, state) {
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
                          child: Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('File selected:'),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 2,
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
                      // Button start parsing
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Start parsing'),
                          ActionChip(
                            label: const Icon(Icons.play_arrow),
                            onPressed: () {
                              context.read<XMLBloc>().parsingXML();
                            },
                          )
                        ],
                      ),
                    ],
                  ));
            case ParsingXMLStatus.loading:
              return CircularProgressIndicator.adaptive();
            case ParsingXMLStatus.error:
              return Center(
                child: TextButton(
                  onPressed: () {
                    context.read<XMLBloc>().init();
                  },
                  child: Text('${state.errorMex}'),
                ),
              );
            case ParsingXMLStatus.success:
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Filter
                      SizedBox(
                        height: 80.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,

                          children: [
                            ...Method.values.map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ActionChip(
                                  color: WidgetStatePropertyAll(
                                      e.color.withValues(alpha: 0.3)),
                                  label: Stack(
                                    children: [
                                      Text(
                                        e.name,
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
                                        e.name,
                                        style: TextStyle(
                                          color: e.color,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    context.read<XMLBloc>().filterXML(e);
                                  },
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
                            Text('List of proxies:'),
                            IconButton(
                                onPressed: () {
                                  context
                                      .read<XMLBloc>()
                                      .filterXML(Method.GET, reset: true);
                                },
                                icon: Icon(Icons.close)),
                            Text('n. ${state.filterList.length}'),
                          ],
                        ),
                      ),
                      // List of Proxies
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.filterList.length,
                          itemBuilder: (context, index) {
                            XMLModel proxy = state.filterList[index];
                            return Card(
                              child: ListTile(
                                title: Text('${proxy.api}'),
                                trailing: Text(
                                  '${proxy.method?.name}',
                                  style: TextStyle(fontSize: 18.0),
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
        });
  }
}
