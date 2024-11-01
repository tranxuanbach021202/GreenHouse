
import 'package:flutter/material.dart';
import 'package:greenhouse/utils/shared_prefs.dart';


// viewmodels/splash_viewmodel.dart
class SplashViewModel extends ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<bool> checkFirstTime() async {
    try {
      final isIntroSeen = await SharedPreferencesHelper.isIntroSeen();
      return isIntroSeen;
    } catch (e) {
      print('Error checking first time: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}