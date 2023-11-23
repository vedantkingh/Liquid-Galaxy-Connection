import 'package:flutter/material.dart';
import 'package:lg_connection/components/connection_flag.dart';
import 'package:shared_preferences/shared_preferences.dart';
// TODO : Import file
import 'package:lg_connection/connections/ssh.dart';
import 'package:dartssh2/dartssh2.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _ipController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _sshPortController = TextEditingController();
  final TextEditingController _rigsController = TextEditingController();

  @override
  void dispose() {
    _ipController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _sshPortController.dispose();
    _rigsController.dispose();
    super.dispose();
  }

  Future<void> _saveSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Check if the text in the controllers is not empty before saving
    if (_ipController.text.isNotEmpty) {
      await prefs.setString('ipAddress', _ipController.text);
    }
    if (_usernameController.text.isNotEmpty) {
      await prefs.setString('username', _usernameController.text);
    }
    if (_passwordController.text.isNotEmpty) {
      await prefs.setString('password', _passwordController.text);
    }
    if (_sshPortController.text.isNotEmpty) {
      await prefs.setString('sshPort', _sshPortController.text);
    }
    if (_rigsController.text.isNotEmpty) {
      await prefs.setString('numberOfRigs', _rigsController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connection Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ConnectionFlag(
                  status: false,
                )),
            TextField(
              controller: _ipController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.computer),
                labelText: 'IP address',
                hintText: 'Enter Master IP',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _usernameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'LG Username',
                hintText: 'Enter your username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'LG Password',
                hintText: 'Enter your password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _sshPortController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.settings_ethernet),
                labelText: 'SSH Port',
                hintText: '22',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _rigsController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.memory),
                labelText: 'No. of LG rigs',
                hintText: 'Enter the number of rigs',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
              onPressed: () async {
                await _saveSettings(); // Save the settings asynchronously and wait for it to complete.
                SSH ssh = SSH();
                String? result = await ssh
                    .connectToLG(); // Connect to LG asynchronously and wait for the result.
                if (result == 'Connected') {
                  // Connection successful, you can now execute commands.
                  print('Connected to LG successfully');
                } else {
                  // Handle connection error
                  print(result);
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cast,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'CONNECT TO LG',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
              onPressed: () async {
                SSH ssh = SSH();
                await ssh.connectToLG(); // Ensure connection before executing
                SSHSession? execResult = await ssh
                    .execute(); // Execute command asynchronously and wait for the result.
                if (execResult != null) {
                  // Command executed, you can check the result.
                  print('Command executed successfully');
                } else {
                  // Handle execution error
                  print('Failed to execute command');
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cast,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'SEND COMMAND TO LG',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
