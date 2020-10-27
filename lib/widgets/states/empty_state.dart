import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String message;

  EmptyState({this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          child: Image.asset(
            "assets/images/empty.gif",
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 3,
              child: Text(
                message,
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
