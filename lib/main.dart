import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        '/settings': (context) => SettingsPage(), // Settings route
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LG Connection'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page using the named route
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      // Rest of your scaffold body
    );
  }
}
