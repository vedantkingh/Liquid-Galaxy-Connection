import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lg_connection/home_screen.dart';
import 'package:lg_connection/settings_page.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure plugin services are initialized.
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
      // Define the initial route
      initialRoute: '/',
      // Map all the routes
      routes: {
        '/': (context) => HomeScreen(), // Root route
        '/settings': (context) => const SettingsPage(), // Settings route
      },
    );
  }
}
