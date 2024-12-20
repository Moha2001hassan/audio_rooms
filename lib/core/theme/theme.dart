import 'package:flutter/material.dart';

import 'custom_themes/elevated_btn_theme.dart';
import 'custom_themes/fab_theme.dart';
import 'custom_themes/outlined_btn_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';

class MyAppTheme {
  MyAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Cairo',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    inputDecorationTheme: MyTextFormFieldTheme.lightInputDecorationTheme,
    elevatedButtonTheme: MyElevatedBtnTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: MyOutLinedBtnTheme.lightOutlinedButtonTheme,
    textTheme: MyTextTheme.lightTextTheme,
    floatingActionButtonTheme: MyFabTheme.lightFloatingActionButtonTheme,
  );
}