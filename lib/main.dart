import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xml_parser/feature/xml/bloc/xml_bloc.dart';
import 'package:xml_parser/feature/xml/screen/xml_page.dart';
import 'package:xml_parser/config/theme/cubit/theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class AppProvider extends StatelessWidget {
  const AppProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Theme Cubit
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()..getTheme()),
        // XML Bloc
        BlocProvider<XMLBloc>(create: (context) => XMLBloc()),
      ],
      child: GestureDetector(child: child),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppProvider(
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            themeMode: themeState,
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            home: const XmlPage(),
          );
        },
      ),
    );
  }
}
