import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xml_parser/config/supabase/supabase_db.dart';
import 'package:xml_parser/feature/api/bloc/api_bloc.dart';
import 'package:xml_parser/feature/upload/bloc/upload_bloc.dart';
import 'package:xml_parser/feature/upload/repo/upload_repo.dart';
import 'package:xml_parser/feature/xml/bloc/xml_bloc.dart';
import 'package:xml_parser/config/theme/cubit/theme_cubit.dart';
import 'package:xml_parser/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseDB.init();
  runApp(const MyApp());
}

class AppProvider extends StatelessWidget {
  const AppProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // Supabase DB
        RepositoryProvider<UploadRepo>(create: (context) => UploadRepo()),
      ],
      child:
        MultiBlocProvider(
          providers: [
            // Theme Cubit
            BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()..getTheme()),
            // XML Bloc
            BlocProvider<XMLBloc>(create: (context) => XMLBloc()),
            // API Bloc
            BlocProvider<ApiBloc>(create: (context) => ApiBloc()),
            // Upload Bloc
            BlocProvider<UploadBloc>(create: (context) => UploadBloc(context.read<UploadRepo>())),

          ],
          child: child,
        ),

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
                PointerDeviceKind.trackpad,
              },
            ),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
