import 'package:e_commerce/screens/Login.dart';
import 'package:e_commerce/screens/homepage.dart';
import 'package:e_commerce/screens/listproduct.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}
