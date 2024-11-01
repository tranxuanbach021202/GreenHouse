import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:greenhouse/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';


class OtpViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _otpCode = '';
  String get otpCode => _otpCode;

  var logger = Logger();

  void someFunction(String e) {
    logger.e(e);
  }


  Future<bool> verifyOtp(String email, String otpCode) async {
    try {
      _isLoading = true;
      notifyListeners();

      final response = await _authService.verifyOtp(email, otpCode);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      return true;
      _isLoading = false;
      notifyListeners();
      throw e;
    }
  }

  void updateOtp(String otp) {
    _otpCode = otp;
    notifyListeners();
  }
}

