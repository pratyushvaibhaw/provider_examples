//using stateless widgets as stateful widget , password also obscured with this concept

import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});
  //Important : these notifiers can't be disposed 
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(
      true); //toggle variable controls the visibility of icons and obscure property of pwd field.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, child) {
                  return Text(_counter.value
                      .toString()); //this widget gets updated despite of being stateless
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ValueListenableBuilder(
                valueListenable: toggle,
                builder: (context, value, child) {
                  return TextFormField(
                    decoration: InputDecoration(
                        enabled: true,
                        hintText: 'password',
                        suffixIcon: InkWell(
                          // splashColor: Colors.transparent, already applied in theme data
                          onTap: () {
                            toggle.value = !toggle
                                .value; //here toggle variable is updated without any change of state and it is stateless as well.

                          },
                          child: (!toggle.value)
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        )),
                    obscureText: toggle.value,
                    keyboardType: TextInputType.visiblePassword,
                  );
                })
          ],
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 80,
        title: RichText(
          text: TextSpan(
              text: 'Using Stateless Widget as Stateful Widget',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          debugPrint(_counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
