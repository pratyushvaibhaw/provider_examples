import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_one/provider/auth_provider.dart';
import 'package:provider_one/provider/count_provider.dart';
import 'package:provider_one/provider/dark_theme_provider.dart';
import 'package:provider_one/provider/example_first_provider.dart';
import 'package:provider_one/provider/favourite_provider.dart';
import 'package:provider_one/screens/count_screen.dart';
import 'package:provider_one/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //in case we have only one provider class we only return ChangeNotifierProvider()
    return MultiProvider(
        //it is on top of material app
        providers: [
          ChangeNotifierProvider(
            create: (context) => CountProvider(),
          ),
          ChangeNotifierProvider(create: (context) => ExampleFirstProvider()),
          ChangeNotifierProvider(create: (context) => FavouriteProvider()),
          ChangeNotifierProvider(create: (context) => DarkThemeProvider()),
          ChangeNotifierProvider(create: (context) => AuthProvider()),
        ],
        //for giving context to themechanger we are using Builder;
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<DarkThemeProvider>(context);

          return MaterialApp(
            darkTheme: ThemeData(
              appBarTheme:
                  AppBarTheme(backgroundColor: Colors.blueGrey.shade400),
              brightness: Brightness.dark,
            ),
            themeMode: themeChanger.themeMode,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                splashColor: Colors
                    .transparent, //to nullify the unnecessary splash of inkwell and other buttons
                appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 20),
                  backgroundColor: Colors.brown,
                ),
                primarySwatch: Colors.brown,
                brightness: Brightness.light),
            home: LoginScreen(),
          );
        }));
  }
}
