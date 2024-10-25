class RecoverPasswordGetModel {
  RecoverPasswordGetModel({
    required this.message,
  });

  final String? message;

  RecoverPasswordGetModel copyWith({
    String? message,
  }) {
    return RecoverPasswordGetModel(
      message: message ?? this.message,
    );
  }

  factory RecoverPasswordGetModel.fromJson(Map<String, dynamic> json) {
    return RecoverPasswordGetModel(
      message: json["message"],
    );
  }
}
