

class AuthResponse {
  final String token;
  final String refreshToken;
  final String? error;

  AuthResponse({
    required this.token,
    required this.refreshToken,
    this.error,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'],
      refreshToken: json['refreshToken'],
      error: json['error'],
    );
  }
}
