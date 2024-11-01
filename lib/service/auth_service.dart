import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:greenhouse/resources/api_constant.dart';

import 'package:greenhouse/models/user.dart';
import 'package:logger/logger.dart';
import 'package:greenhouse/models/auth_response.dart';
import 'package:greenhouse/models/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  var logger = Logger();

  void someFunction(String e) {
    logger.e(e);
  }
  Future<http.Response> signup(String fullName, String email, String password) async {

    try {
      someFunction(fullName + email + password + "1");
      final response = await http.post(
        Uri.parse('${ApiConstant.baseUrl}${ApiConstant.signup}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': fullName,
          'email': email,
          'password': password,
          'role': 'ROLE_ADMIN'
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        someFunction(fullName + email + password);
        return response;
      } else {
        throw Exception('Signup failed: ${response.body}');
      }
    } catch (e) {
      throw Exception('Signup failed: $e');
    }
  }

  Future<http.Response> verifyOtp(String email, String otpCode) async {
    try {
      final response = await http.post(
        Uri.parse('${ApiConstant.baseUrl}${ApiConstant.verifyOtp}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'otp': otpCode,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return response;
      } else {
        throw Exception('Signup failed: ${response.body}');
      }
    } catch (e) {
      throw Exception('Signup failed: $e');
    }
  }


  Future<LoginResponse> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('${ApiConstant.baseUrl}${ApiConstant.login}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final loginResponse = LoginResponse.fromJson(data);

        // Lưu token vào SharedPreferences
        await _saveToken(loginResponse.token);

        return loginResponse;
      } else {
        throw Exception('Login failed: ${response.body}');
      }
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }


  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }


}