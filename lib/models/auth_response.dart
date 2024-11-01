class AuthResponse {
  final bool success;
  final String? token;
  final String? role;
  final String? message;

  AuthResponse({
    required this.success,
    this.token,
    this.role,
    this.message,
  });
}