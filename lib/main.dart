import 'package:flutter/material.dart';
import 'package:text_app/Screens/splash.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Sample',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ScreenSplash(),
    );
  }
}
