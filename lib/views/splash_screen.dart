import 'package:flutter/material.dart';
import 'package:greenhouse/resources/color.dart';
import 'package:greenhouse/viewmodels/splash_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:greenhouse/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _checkFirstTime();
  }

  // Check đã sử dụng app
  Future<void> _checkFirstTime() async {
    final viewModel = context.read<SplashViewModel>();
    final isIntroSeen = await viewModel.checkFirstTime();

    if (isIntroSeen) {
      // Chuyển tới màn hình login
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    } else {
      // Lần đầu tiên đăng nhập chuyển tới màn hình intro
      Navigator.pushReplacementNamed(context, AppRoutes.intro);
    }
  }


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