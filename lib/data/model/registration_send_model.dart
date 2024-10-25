class RegistrationSendModel {
  final String email;
  final String password;
  final String fullName;
  final String username;

  RegistrationSendModel({
    required this.email,
    required this.password,
    required this.fullName,
    required this.username,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'full_name': fullName,
      'username': username,
    };
  }
}

