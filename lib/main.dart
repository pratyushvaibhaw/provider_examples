import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_one/provider/count_provider.dart';
import 'package:provider_one/screens/count_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(//it is on top of material app

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: CountScreen(),
      ),
      create: (context) => CountProvider(),
    );
  }
}
