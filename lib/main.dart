import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lg_connection/screens/home_screen.dart';
import 'package:lg_connection/screens/settings_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    // Lock orientation to landscape
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(), // Root route
        '/settings': (context) => const SettingsPage(), // Settings route
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFEEEEEE),
        appBarTheme: AppBarTheme(
          color: Color(0xFF111111),
        ),
      ),
    );
  }
}
