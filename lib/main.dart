import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_one/provider/count_provider.dart';
import 'package:provider_one/provider/example_first_provider.dart';
import 'package:provider_one/screens/count_screen.dart';

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
        ChangeNotifierProvider(create: (context) => ExampleFirstProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: CountScreen(),
      ),
    );
  }
}
