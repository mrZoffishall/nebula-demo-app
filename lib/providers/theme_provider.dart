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
    brightness: Brightness.light,
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

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0XFF69CA87),
    accentColor: Color(0XFF313131),
    scaffoldBackgroundColor: Color(0XFF313131),
    backgroundColor: Color(0XFF313537),
    cursorColor: Colors.white,
    primarySwatch: Colors.green,
    shadowColor: Colors.black.withOpacity(0.5),
    textTheme: TextTheme(
      headline1: GoogleFonts.openSans(
        fontSize: 24.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headline2: GoogleFonts.openSans(
        fontSize: 18.0,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      bodyText2: GoogleFonts.openSans(
        fontSize: 14.0,
        color: Color(0XFF78909C),
      ),
    ),
  );
}
