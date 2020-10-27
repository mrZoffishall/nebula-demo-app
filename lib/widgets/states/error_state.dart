import 'package:flutter/widgets.dart';

class ErrorState extends StatelessWidget {
  final String message;

  ErrorState({this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          child: Image.asset("assets/images/error.png"),
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
