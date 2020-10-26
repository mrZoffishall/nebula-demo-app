import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData appTheme;

  ThemeProvider() {
    this.appTheme = this.lightTheme;
  }

  setAppTheme(ThemeData theme) {
    this.appTheme = theme;
    notifyListeners();
  }

  final ThemeData lightTheme = ThemeData(
    primaryColor: Color(0XFF69CA87),
    accentColor: Color(0XFFFFFFFF),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Color(0XFFF6F7FB),
    cursorColor: Colors.black,
    primarySwatch: Colors.green,
    shadowColor: Colors.black.withOpacity(0.5),
    textTheme: TextTheme(
      headline1: GoogleFonts.openSans(
        fontSize: 24.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      headline2: GoogleFonts.openSans(
        fontSize: 18.0,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
      bodyText2: GoogleFonts.openSans(
        fontSize: 14.0,
        color: Color(0XFF78909C),
      ),
    ),
  );
}