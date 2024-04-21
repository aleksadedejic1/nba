import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Color.fromRGBO(85, 122, 255, 1),
    secondary: Color.fromRGBO(245, 245, 245, 1),
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: Color.fromRGBO(29, 29, 29, 1),
    displayColor: Colors.black,
  ),
);


ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Color(0xFF292929),
    primary: Color.fromRGBO(85, 122, 255, 1),
    secondary: Color(0xFF313131),
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: Color(0xFFF5F5F5),
    displayColor: Colors.white,
  ),
);
