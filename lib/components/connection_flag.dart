import 'package:flutter/material.dart';

class ConnectionFlag extends StatelessWidget {
  // const ConnectionFlag({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: Colors.red,
        ),
        SizedBox(
          width: 5.0,
        ),
        Text(
          'DISCONNECTED',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
