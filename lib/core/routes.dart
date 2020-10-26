import 'package:flutter/material.dart';
import 'package:nebula/screens/home_screen.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  "/": (context) => HomeScreen(),
};