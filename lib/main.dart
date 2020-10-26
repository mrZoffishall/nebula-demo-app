import 'package:flutter/material.dart';
import 'package:nebula/core/nebula.dart';
import 'package:nebula/providers/theme_provider.dart';
import 'package:provider/provider.dart';

main(List<String> args) {
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Nebula(),
    ),
  );
}
