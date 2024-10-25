class ConfirmModel {
  final String email;
  final int verificationCode;

  ConfirmModel({
    required this.email,
    required this.verificationCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'verification_code': verificationCode,
    };
  }
}
