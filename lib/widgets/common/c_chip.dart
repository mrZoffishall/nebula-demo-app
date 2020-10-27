import 'package:flutter/material.dart';

class CChip extends StatelessWidget {
  final String label;
  final Function onTap;

  CChip({this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Chip(
          label: Text(this.label),
          elevation: 2.5,
          backgroundColor: Theme.of(context).accentColor,
          shadowColor: Theme.of(context).shadowColor,
          labelStyle: Theme.of(context).textTheme.bodyText2.apply(fontSizeDelta: -4),
        ),
      ),
    );
  }
}
