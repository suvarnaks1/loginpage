import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_app/Screens/home.dart';
import 'package:text_app/main.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _UsernameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: _UsernameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'UserName'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Password'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  checkLogin(context);
                },
                child: Text('login')),
          ],
        ),
      ),
    ));
  }

  void checkLogin(BuildContext context) async {
    final _username = _UsernameController.text;
    final _password = _passwordController.text;
    if (_username == _password) {
      print('correct');

      final _sharedprefs = await SharedPreferences.getInstance();
     await _sharedprefs.setBool(SAVE_KEY_NAME, true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ScreenHome()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("password and user id doesnot match")));
    }
  }
}
