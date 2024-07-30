import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  MyButtons({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text),
    );
  }
}
