import 'package:flutter/material.dart';

/// As per we want theme for all app screen ///

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.red,
  outlinedButtonTheme: OutlinedButtonThemeData(

    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.red ,
      textStyle: const TextStyle(color: Colors.red),
      side: const BorderSide(
          color: Colors.red, width: 1.5),
    ),
  ),
  inputDecorationTheme:  InputDecorationTheme(
    border: _outlineInputBorder,
    errorBorder: _outlineErrorInputBorder,
    enabledBorder: _outlineInputBorder,
    focusedBorder: _outlineEnableInputBorder,
    focusColor: Colors.red,
    disabledBorder:  const OutlineInputBorder(),
    prefixIconColor: Colors.red

  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 18.0),
      backgroundColor: Colors.red,
      disabledBackgroundColor: Colors.red.shade100,
    ),
  ),
);


OutlineInputBorder _outlineInputBorder = const OutlineInputBorder(
  borderSide: BorderSide(color: Colors.grey)
);

OutlineInputBorder _outlineErrorInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black)
);

OutlineInputBorder _outlineEnableInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red)
);