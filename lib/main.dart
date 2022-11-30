import 'package:flutter/material.dart';

import 'ui/home.dart';

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.blue,
    backgroundColor: Colors.red,
    textTheme: _appTextTheme(base.textTheme)
  );
}

TextTheme _appTextTheme (TextTheme base) {
  return base.copyWith(
    headline1: base.headline1!.copyWith(
      fontWeight: FontWeight.w500
    ),
     titleMedium: base.titleMedium!.copyWith(
      fontSize: 18.0,
     ),
     bodyText1: base.bodyText1!.copyWith(
      fontSize: 19.0,
     )
  );
}



void main() => runApp(new MaterialApp(
  theme: _appTheme,
      home: QuizApp(),
    ));
