import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_one/provider/dark_theme_provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => DarkThemeScreenState();
}

class DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: Colors.lightBlue.shade200,
        title: Text(
          'Theme  Screen',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 20),
        ),
        toolbarHeight: 80,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                RadioListTile<ThemeMode>(
                  title: Text('Light Mode'),
                  value: ThemeMode.light,
                  groupValue: themeChanger.themeMode,
                  onChanged: themeChanger.setTheme,
                ),
                RadioListTile<ThemeMode>(
                  title: Text('Dark Mode'),
                  value: ThemeMode.dark,
                  groupValue: themeChanger.themeMode,
                  onChanged: themeChanger.setTheme,
                ),
                RadioListTile<ThemeMode>(
                    title: Text('System Mode'),
                    value: ThemeMode.system,
                    groupValue: themeChanger.themeMode,
                    onChanged: themeChanger.setTheme),
              ],
            ),
          )
        ],
      ),
    );
  }
}
