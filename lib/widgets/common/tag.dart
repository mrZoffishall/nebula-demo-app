import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String label;
  final Color color;

  Tag({this.color, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 10.0,
          ),
        ),
      ),
    );
  }
}
