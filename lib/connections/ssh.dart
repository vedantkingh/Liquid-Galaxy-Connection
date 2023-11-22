import 'package:flutter/material.dart';
// TODO 2: Import 'dartssh2' package
import 'package:dartssh2/dartssh2.dart';

import 'dart:async';
import 'dart:io';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartssh2/dartssh2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SSH {
  late String _host;
  late int _port;
  late String _username;
  late String _passwordOrKey;
  SSHClient? _client;

  // Initialize connection details from shared preferences
  Future<void> initConnectionDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _host = prefs.getString('ipAddress') ?? 'default_host';
    _port = prefs.getInt('sshPort') ?? 22;
    _username = prefs.getString('username') ?? 'lg';
    _passwordOrKey = prefs.getString('password') ?? 'lg';
  }

  // Connect to the Liquid Galaxy system
  Future<String?> connectToLG() async {
    await initConnectionDetails(); // Ensure connection details are loaded

    try {
      final socket = await SSHSocket.connect(_host, _port,
          timeout: const Duration(seconds: 5));
      _client = SSHClient(
        socket,
        username: _username,
        onPasswordRequest: () => _passwordOrKey,
      );

      await _client?.authenticated;
      if (_client?.onAuthenticated == true) {
        print('Connected to Liquid Galaxy system successfully.');
        return 'Connected';
      } else {
        return 'Authentication failed';
      }
    } on SocketException catch (e) {
      print('Failed to connect: $e');
      return 'Connection failed';
    }
  }

  // Execute command on the Liquid Galaxy system
  // Future<String> executeCommand(String command) async {
  //   if (_client == null || !(_client?.onAuthenticated == true)) {
  //     return 'Not connected to the Liquid Galaxy system.';
  //   }
  //
  //   final execResult = await _client!.execute(command);
  //   return utf8.decode(execResult);
  // }
  //
  // // Disconnect from the Liquid Galaxy system
  // void disconnect() {
  //   _client?.close();
  //   print('Disconnected from Liquid Galaxy system.');
  // }
}

// void main() async {
//   final lgConnector = LiquidGalaxyConnector();
//
//   // Connect to the Liquid Galaxy system
//   final connectionResult = await lgConnector.connectToLG();
//   print(connectionResult);
//
//   // Execute a command, for example, to get the uptime
//   if (connectionResult == 'Connected') {
//     final uptime = await lgConnector.executeCommand('uptime');
//     print('System Uptime: $uptime');
//   }
//
//   // Disconnect from the system
//   lgConnector.disconnect();
// }
