import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_one/provider/example_first_provider.dart';

class ExampleFirst extends StatefulWidget {
  const ExampleFirst({super.key});

  @override
  State<ExampleFirst> createState() => _ExampleFirstState();
}

class _ExampleFirstState extends State<ExampleFirst> {
  double value = 0.5;
  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    // final valueProvider =
    //     Provider.of<ExampleFirstProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleFirstProvider>(
              builder: (context, valueProvider, child) {
            return Slider(
                label: 'opacity ${valueProvider.value}',
                thumbColor: Colors.red,
                activeColor: Colors.black54,
                min: 0,
                divisions: 10,
                max: 1,
                value: valueProvider.value,
                onChanged: (val) {
                  debugPrint(val.toString());
                  valueProvider.setValue(val);
                });
          }),
          Consumer<ExampleFirstProvider>(
              builder: (context, valueProvider, child) {
            return Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(8),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.withOpacity(valueProvider
                        .value), //opacity lies in between 0.0-1.0 so giving value >1 results in error.
                  ),
                  child: Center(
                    child: Text('lightBlue'),
                  ),
                )),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color:
                        Colors.lightBlueAccent.withOpacity(valueProvider.value),
                  ),
                  height: 100,
                  child: Center(
                    child: Text('lightBlueAccent'),
                  ),
                )),
              ],
            );
          }),
        ],
      ),
    );
  }
}
