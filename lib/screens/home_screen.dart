import 'package:flutter/material.dart';
import 'package:lg_connection/components/connection_flag.dart';
import '../components/reusable_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LG Connection'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page using the named route
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(padding: const EdgeInsets.all(10.0), child: ConnectionFlag()),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: Colors.blue,
                    onPress: () {},
                    cardChild: const Center(
                      child: Text(
                        'SHUT DOWN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Colors.blue,
                    onPress: () {},
                    cardChild: const Center(
                      child: Text(
                        'SHUT DOWN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          //
          Expanded(
            child: ReusableCard(
              colour: Colors.blue,
              onPress: () {},
              cardChild: const Center(
                child: Text(
                  'SHUT DOWN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: Colors.blue,
                    onPress: () {},
                    cardChild: const Center(
                      child: Text(
                        'SHUT DOWN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Colors.blue,
                    onPress: () {},
                    cardChild: const Center(
                      child: Text(
                        'SHUT DOWN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
