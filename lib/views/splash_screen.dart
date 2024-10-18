import 'package:flutter/material.dart';
import 'package:greenhouse/resources/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.mediumSkyBlue,
        child: Center(
          child: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset("assets/icon_greenhouse.png"),
          ),
        ),
      ),
    );
  }
}