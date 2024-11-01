import 'package:flutter/material.dart';
import 'package:greenhouse/views/home_screen.dart';
import 'package:greenhouse/views/intro_screen.dart';
import 'package:greenhouse/views/otp_screen.dart';
import 'package:greenhouse/views/signup_screen.dart';
import 'package:greenhouse/views/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String intro ='/intro';
  static const String home = '/home';
  static const String signup = '/signup';
  static const String otp = '/otp';
  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    intro: (context) => IntroScreen(),
    signup: (context) => const SignUpScreen(),
    otp: (context) => OtpScreen(email: '',),
    home: (context) => HomeScreen(),
  };
}