import 'package:flutter/material.dart';
import 'package:state_mangment_provider/bmi_calculator/constants.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      secondary: Colors.white38,
      background: Colors.white,
      brightness: Brightness.light,
      tertiary: Colors.purple,
        onSecondary: Colors.purple

    ),


    scaffoldBackgroundColor: Colors.white70,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: kNumberTextStyle.copyWith(fontSize: 30,color:Colors.black),
    ),
    iconTheme: const IconThemeData(color: Colors.black),


    textTheme:  TextTheme(
      displayLarge: kBMITextStyle.copyWith(color:Colors.black),
      displayMedium: kNumberTextStyle.copyWith(color:Colors.black),
      displaySmall: kLargeButtonTextStyle..copyWith(color:Colors.black),

      headlineLarge: kResultTextStyle,
      headlineMedium: kBodyTextStyle.copyWith(color:Colors.black),
      headlineSmall: kLabelTextStyle.copyWith(color:Colors.black),
    ),

  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: kActiveCardColour,
      secondary: kInactiveCardColour,
      background: Colors.white,
      brightness: Brightness.light,

    ),

    scaffoldBackgroundColor: kInactiveCardColour,
    appBarTheme: AppBarTheme(
      backgroundColor: kInactiveCardColour,
      titleTextStyle: kNumberTextStyle.copyWith(fontSize: 30),
    ),
    iconTheme: const IconThemeData(color: Colors.white),


    textTheme: const TextTheme(
      displayLarge: kBMITextStyle,
      displayMedium: kNumberTextStyle,
      displaySmall: kLargeButtonTextStyle,

      headlineLarge: kResultTextStyle,
      headlineMedium: kBodyTextStyle,
      headlineSmall: kLabelTextStyle,
    ),
      );
}
