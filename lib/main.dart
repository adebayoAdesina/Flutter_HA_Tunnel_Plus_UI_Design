import 'package:flutter/material.dart';
import 'Responsiveness/reponsive.dart';
import 'Theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadThemeMode();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, mode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'HA Tunnel Plus',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: mode,
          home: const Responsive(),
        );
      },
    );
  }
}
