import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:state_mangment_provider/bmi_calculator/provider/height_provider.dart';
import 'package:state_mangment_provider/bmi_calculator/provider/weight_age_provider.dart';
import 'package:state_mangment_provider/bmi_calculator/screens/input_page.dart';
import 'package:state_mangment_provider/bmi_calculator/theme/app_theme.dart';
import 'package:state_mangment_provider/provider/count_provider.dart';
import 'package:state_mangment_provider/provider/silder_provider.dart';
import 'package:state_mangment_provider/screens/change_notifier.dart';
import 'package:state_mangment_provider/screens/clock_screen.dart';
import 'package:state_mangment_provider/screens/favourite_screen.dart';
import 'package:state_mangment_provider/screens/slider_screen.dart';
import 'package:state_mangment_provider/screens/theme_screen.dart';

import 'bmi_calculator/provider/gender_provider.dart';
import 'provider/favourite_provider.dart';
import 'provider/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ColorProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => GenderProvider()),
        ChangeNotifierProvider(create: (_) => HeightProvider()),
        ChangeNotifierProvider(create: (_) => WeightAgeProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            home: InputPage(),
          );
        },
      ),
    );
  }
}

//single Provider
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (BuildContext context) {
//         return CountProvider();
//       },
//       child: const MaterialApp(
//         title: 'Flutter Demo',
//         home: ClockScreen(),
//       ),
//     );
//   }
// }
