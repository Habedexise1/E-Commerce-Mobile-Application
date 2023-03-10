import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;
  MyButton({required this.name, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.lightBlue),
        child: Text('Login'),
        onPressed: onPressed,
      ),
    );
  }
}

