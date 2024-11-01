import 'package:flutter/material.dart';
import 'package:greenhouse/service/auth_service.dart';
import 'package:logger/logger.dart';

class SignupViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  String? _error;
  bool _isPasswordVisible = false;

  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }


  var logger = Logger();

  void someFunction(String e) {
    logger.e(e);
  }

  Future<bool> signup(String fullName, String email, String password) async {
    if (fullName.isEmpty || email.isEmpty || password.isEmpty) {
      _error = "All fields are required";
      notifyListeners();
      return false;
    }

    if (!email.contains('@')) {
      _error = "Please enter a valid email";
      notifyListeners();
      return false;
    }

    if (password.length < 6) {
      _error = "Password must be at least 6 characters";
      notifyListeners();
      return false;
    }

    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _authService.signup(fullName, email, password);

      _isLoading = false;
      notifyListeners();
      someFunction("thanh cong");
      return true;
    } catch (e) {
      _isLoading = false;
      _error = e.toString();
      notifyListeners();
      someFunction("faile");
      return false;
    }
  }
}