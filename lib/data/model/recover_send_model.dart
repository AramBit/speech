class RecoverPasswordSendModel {
  final String email;

  RecoverPasswordSendModel({
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
