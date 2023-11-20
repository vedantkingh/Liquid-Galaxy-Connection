import 'package:flutter/material.dart';

class ConnectionFlag extends StatelessWidget {
  ConnectionFlag({required this.status});
  final bool status;

  @override
  Widget build(BuildContext context) {
    Color color = status ? Colors.green : Colors.red;
    String label = status ? 'CONNECTED' : 'DISCONNECTED';
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: color,
        ),
        SizedBox(
          width: 5.0,
        ),
        Text(
          label,
          style: TextStyle(color: color, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
