import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool loading = false;
  bool _obscure = true;
  bool get load => loading;
  bool get obscure => _obscure;
  setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  setObscure(bool value) {
    _obscure = value;
    notifyListeners();
  }

  void login(String email, String pwd) async {
    setLoading(true);
    try {
      Response response = await post(Uri.parse('https://reqres.in/api/login'),
          body: {'email': email, 'password': pwd});
      if (response.statusCode == 200) {
        final token = response.body;
        print('Login Successful\nToken: $token');
        setLoading(false);
      } else {
        setLoading(false);
        debugPrint('failed');
      }
    } catch (e) {
      setLoading(false);
      debugPrint(e.toString());
    }
  }
}
