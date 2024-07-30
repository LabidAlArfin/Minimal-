import 'package:flutter/material.dart';
import 'package:minimal/pages/login_pages.dart';
import 'package:minimal/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  final void Function()? toggleTheme;

  LoginOrRegister({this.toggleTheme});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reader Clone'),
        actions: [
          Switch(
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (value) {
              widget.toggleTheme?.call();
            },
          ),
        ],
      ),
      body: showLoginPage
          ? LoginPage(onTap: togglePages)
          : RegisterPage(onTap: togglePages),
    );
  }
}