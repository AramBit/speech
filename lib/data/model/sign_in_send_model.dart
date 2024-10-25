class SignInSendModel {
  final String email;
  final String password;

  SignInSendModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': email,
      'password': password,
    };
  }
}
