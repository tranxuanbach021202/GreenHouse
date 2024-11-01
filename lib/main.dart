import 'package:flutter/material.dart';
import 'package:greenhouse/resources/strings.dart';
import 'package:greenhouse/routes/app_routes.dart';
import 'package:greenhouse/viewmodels/intro_viewmodel.dart';
import 'package:greenhouse/viewmodels/otp_viewmodel.dart';
import 'package:greenhouse/viewmodels/signup_viewmodel.dart';
import 'package:greenhouse/viewmodels/splash_viewmodel.dart';
import 'package:greenhouse/views/intro_screen.dart';
import 'package:greenhouse/views/login_screen.dart';
import 'package:greenhouse/views/signup_screen.dart';
import 'package:greenhouse/views/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashViewModel()),
        ChangeNotifierProvider(create: (_) => IntroViewModel()),
        ChangeNotifierProvider(create: (_) => SignupViewModel()),
        ChangeNotifierProvider(create: (_) => OtpViewModel()),

      ],
      child: MaterialApp(
        title: AppStrings.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppRoutes.signup,
        routes: AppRoutes.routes,
      ),
    );
  }
}


