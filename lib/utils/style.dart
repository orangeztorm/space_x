

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_x/utils/colors.dart';

/// Class that contains all the different styles of an app
class Style{
  /// custom page transitions
  static final _pageTransitionsTheme = PageTransitionsTheme(
    builders: const {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
    }
  );

  /// light style
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: light.primaryColor,
    accentColor: light.accentColor,
    pageTransitionsTheme: _pageTransitionsTheme,
    textTheme: GoogleFonts.rubikTextTheme(ThemeData.light().textTheme),
    popupMenuTheme: PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6)
      )
    )
  );

  /// Dark style
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    accentColor: darkAccentColor,
    canvasColor: darkCanvasColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    cardColor: darkCardColor,
    dividerColor: darkDividerColor,
    dialogBackgroundColor: darkCardColor,
    pageTransitionsTheme: _pageTransitionsTheme,
    textTheme: GoogleFonts.rubikTextTheme(ThemeData.dark().textTheme),
    popupMenuTheme: PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );

  /// Black style (OLED)
  static final ThemeData black = ThemeData(
    brightness: Brightness.dark,
    primaryColor: blackPrimaryColor,
    accentColor: blackAccentColor,
    canvasColor: blackPrimaryColor,
    scaffoldBackgroundColor: blackPrimaryColor,
    cardColor: blackPrimaryColor,
    dividerColor: darkDividerColor,
    dialogBackgroundColor: darkCardColor,
    pageTransitionsTheme: _pageTransitionsTheme,
    textTheme: GoogleFonts.rubikTextTheme(ThemeData.dark().textTheme),
    popupMenuTheme: PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(color: darkDividerColor),
      ),
    ),
  );
}