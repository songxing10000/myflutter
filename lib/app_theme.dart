import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static Color primaryColor = const Color(0xff1c6eee);

  static ThemeData get theme {
    var _theme = ThemeData.light().copyWith(
        primaryColor: primaryColor,
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          // backgroundColor: black5,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          foregroundColor: Colors.white,
          titleTextStyle:
              TextStyle(fontSize: 17, color: Colors.white, height: 1.2),
          toolbarTextStyle:
              TextStyle(fontSize: 14, color: Colors.white, height: 1.2),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateColor.resolveWith(
              (states) {
                return AppTheme.primaryColor;
              },
            ),
            textStyle: MaterialStateProperty.all(
              TextStyle(color: primaryColor, height: 1.2),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: primaryColor,
        ),
        indicatorColor: primaryColor,
        cardColor: Colors.white,
        textTheme: TextTheme(
          button: TextStyle(color: Color(0xFF333333), height: 1.2),
          bodyText1: TextStyle(color: Colors.black, height: 1.2),
          bodyText2: TextStyle(color: Color(0xFF333333), height: 1.2),
          subtitle1: TextStyle(color: Color(0xff262626)),
        ),
        colorScheme: ColorScheme.dark().copyWith(
          primary: primaryColor,
          background: Colors.white,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: primaryColor,
        ),
        dialogBackgroundColor: Colors.white,
        dialogTheme: DialogTheme(
          backgroundColor: Colors.white,
          elevation: 8,
          contentTextStyle: TextStyle(color: Color(0xFF333333), height: 1.2),
        ),
        scaffoldBackgroundColor: Colors.white,
        // shadowColor: grey,
        // canvasColor: primaryColor,
        // dividerColor: black5,
        // indicatorColor: primaryColor,
        // accentColorBrightness: Brightness.light,
        iconTheme: IconThemeData(color: Color(0xFF888888)),
        popupMenuTheme: PopupMenuThemeData(
          textStyle: TextStyle(
            color: Color(0xFF333333),
          ),
        ));

    return _theme;
  }

  static void themeInit() {
    //  primaryColor = Global.appConfigPrimaryCololr;
  }
}
