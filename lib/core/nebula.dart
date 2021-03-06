import 'package:flutter/material.dart';
import 'package:nebula/core/routes.dart';
import 'package:nebula/core/utils/constants.dart';
import 'package:nebula/providers/theme_provider.dart';
import 'package:nebula/core/networker.dart';
import 'package:provider/provider.dart';

class Nebula extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      routes: routes,
      initialRoute: '/',
      theme: context.watch<ThemeProvider>().appTheme,
      debugShowCheckedModeBanner: false,
      navigatorKey: worker.navigatorKey,
    );
  }
}