import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Theme'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            RadioListTile<ThemeMode>(
              title: Text("light"),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setThemeMode,
            ),
            RadioListTile<ThemeMode>(
              title: Text("dark"),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setThemeMode,
            ),
            RadioListTile<ThemeMode>(
              title: Text("system"),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setThemeMode,
            ),
          ],
        ),
    );
  }
}
