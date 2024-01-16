import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_app/Screens/home.dart';
import 'package:text_app/Screens/login.dart';
import 'package:text_app/main.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    gotoLogin();
    super.initState();
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash screen"),
      ),
    );
  }

  @override
  dispose() {
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ScreenLogin(),
      ),
    );
  }

  Future<void> checkUserLoggedIn() async {
    final _sharedprefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedprefs.getBool(SAVE_KEY_NAME);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      gotoLogin();
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ScreenHome()));
    }
  }
}
