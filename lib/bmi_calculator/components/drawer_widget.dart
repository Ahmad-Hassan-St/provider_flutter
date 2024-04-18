import 'package:flutter/material.dart';

import '../../provider/theme_provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.themeChanger,
  });

  final ThemeProvider themeChanger;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "John Doe",
              style: Theme.of(context).textTheme.headlineMedium,
            ), // Replace with the user's name
            accountEmail: Text(
              "john.doe@example.com",
              style: Theme.of(context).textTheme.headlineSmall,
            ), // Replace with the user's email
            currentAccountPicture:  CircleAvatar(
              child: Icon(Icons.person,color:Theme.of(context).iconTheme.color),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .tertiary, // You can set the background color of the header
            ),
          ),
          Text(
            "Select Theme",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          RadioListTile<ThemeMode>(
            title: Text(
              "light",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            value: ThemeMode.light,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setThemeMode,
            activeColor: Theme.of(context).colorScheme.tertiary,
          ),
          RadioListTile<ThemeMode>(
            title: Text(
              "dark",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            value: ThemeMode.dark,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setThemeMode,
            activeColor: Theme.of(context).colorScheme.background,
          ),
          RadioListTile<ThemeMode>(
            title: Text(
              "system",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            value: ThemeMode.system,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setThemeMode,
            activeColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
