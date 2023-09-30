import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_one/provider/count_provider.dart';
import 'package:provider_one/screens/example_first.dart';
import 'package:provider_one/screens/favourite_screen.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({super.key});

  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  // void initState() {
  //  super.initState();
  //   final countProvider = Provider.of<CountProvider>(context, listen: false);
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     countProvider.setCount();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    final countProvider = Provider.of<CountProvider>(context,
        listen: false); //passing the context of the required class
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            countProvider.setCount();
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text('C o u n t    S c r e e n'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ExampleFirst();
                  }));
                },
                child: Text('Example_First')),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FavouriteScreen();
                  }));
                },
                child: Text('Favourite_Screen')),
                
            Center(
              child: Consumer<CountProvider>(
                builder: (context, value, child) {
                  debugPrint('only this widget gets rebuild');
                  return Text(
                    value.count.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
