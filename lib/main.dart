import 'package:flutter/material.dart';
import 'package:greenhouse/views/intro_screen.dart';
import 'package:greenhouse/views/login_screen.dart';
import 'package:greenhouse/views/signup_screen.dart';
import 'package:greenhouse/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greenhouse App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true

      ),
      home: const SignUpScreen(),
    );
  }
}
