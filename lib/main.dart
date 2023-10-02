import 'package:flutter/material.dart';
import 'package:portfolio/controllers/common/providers/theme_mode_provider.dart';
import 'package:portfolio/controllers/utils/theme_data.dart';
import 'package:portfolio/modules/home/home_page_view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeModeProvider()),
      ],
      child: Builder(builder: (context) {
        final themeModeProvider = Provider.of<ThemeModeProvider>(context);
        return MaterialApp(
          title: 'Monirul Islam',
          debugShowCheckedModeBanner: false,
          themeMode:
              themeModeProvider.isLight ? ThemeMode.light : ThemeMode.dark,
          theme: themeModeProvider.isLight ? lightThemeData : darkThemeData,
          home: const HomePageView(),
        );
      }),
    );
  }
}
