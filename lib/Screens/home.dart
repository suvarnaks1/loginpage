import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_app/Screens/login.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      // body: SafeArea( ),
    );
    
  }

  signout(BuildContext context) async {
    final _sharedprefs = await SharedPreferences.getInstance();
   await _sharedprefs.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => ScreenLogin(),
        ),
        (route) => false);
  }
}
