
class LoginResponse {
  final String token;
  final String type;
  final int id;
  final String username;
  final String? email;
  final String role;

  LoginResponse({
    required this.token,
    required this.type,
    required this.id,
    required this.username,
    this.email,
    required this.role,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      type: json['type'],
      id: json['id'],
      username: json['username'],
      email: json['email'],
      role: json['role'],
    );
  }
}
