import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_one/provider/auth_provider.dart';
import 'package:provider_one/screens/count_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    debugPrint('This build is gonna printed only one times');
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        elevation: 0,
        title: Text('W e l c o m e    B a c k'),
        centerTitle: true,
        toolbarHeight: 125,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              style: TextStyle(color: Colors.brown, fontFamily: 'font_one'),
              controller: email,
              decoration: InputDecoration(hintText: 'email'),
            ),
            SizedBox(
              height: 20,
            ),
            Consumer<AuthProvider>(builder: (context, value, child) {
              return TextFormField(
                style: TextStyle(color: Colors.brown, fontFamily: 'font_one'),
                controller: password,
                obscureText: value.obscure,
                decoration: InputDecoration(
                  hintText: 'password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        value.setObscure(!value.obscure);
                      },
                      icon: (!value.obscure)
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off)),
                ),
              );
            }),
            SizedBox(
              height: 80,
            ),
            SizedBox(
              height: 50,
              width: 175,
              child: Consumer<AuthProvider>(builder: (context, value, child) {
                return ElevatedButton(
                    onPressed: () {
                      value.login(
                          email.text.toString(), password.text.toString());
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CountScreen()));
                    },
                    child: (value.load)
                        ? Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                        : Text(' L O G I N '));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
