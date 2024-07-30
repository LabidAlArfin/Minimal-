import 'package:flutter/material.dart';
import 'package:minimal/autherize/login_or_register.dart';
import 'package:minimal/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reader Clone',
      theme: isDarkMode ? darkMode : lightMode,
      home: LoginOrRegister(toggleTheme: toggleTheme),
    );
  }
}
