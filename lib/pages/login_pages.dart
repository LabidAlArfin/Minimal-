import 'package:flutter/material.dart';
import 'dart:io';
import 'package:minimal/pages/home_page.dart';
import 'package:minimal/components/my_textfields.dart';
import 'package:minimal/components/my_buttons.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final void Function()? onTap;

  LoginPage({Key? key, required this.onTap}) : super(key: key);

  void login(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      return;
    }

    // Read from the text file and validate the user
    final file = File('user_data.txt');
    List<String> lines = await file.readAsLines();
    bool isAuthenticated = false;

    for (String line in lines) {
      List<String> userDetails = line.split(',');
      if (userDetails[0] == email && userDetails[1] == password) {
        isAuthenticated = true;
        break;
      }
    }

    if (isAuthenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      print('Login failed. Invalid email or password.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(height: 25),
              Text(
                "R E A D E R C L O N E",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 50),
              MyTextfields(
                hintText: "Email",
                obscureText: false,
                controller: emailController,
              ),
              MyTextfields(
                hintText: "Password",
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              MyButtons(
                text: "Login",
                onTap: () => login(context),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Register Here",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
