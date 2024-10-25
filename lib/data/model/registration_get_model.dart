class RegistracionGetModel {
  RegistracionGetModel({
    this.email,
    this.username,
    this.emailConfirmed,
    this.verificationCode,
    this.registerTime,
    this.isActive,
    this.isSuperuser,
    this.fullName,
    this.id,
  });

  final String? email;
  final String? username;
  final bool? emailConfirmed;
  final num? verificationCode;
  final DateTime? registerTime;
  final bool? isActive;
  final bool? isSuperuser;
  final String? fullName;
  final int? id;

  RegistracionGetModel copyWith({
    String? email,
    String? username,
    bool? emailConfirmed,
    num? verificationCode,
    DateTime? registerTime,
    bool? isActive,
    bool? isSuperuser,
    String? fullName,
    int? id,
  }) {
    return RegistracionGetModel(
      email: email ?? this.email,
      username: username ?? this.username,
      emailConfirmed: emailConfirmed ?? this.emailConfirmed,
      verificationCode: verificationCode ?? this.verificationCode,
      registerTime: registerTime ?? this.registerTime,
      isActive: isActive ?? this.isActive,
      isSuperuser: isSuperuser ?? this.isSuperuser,
      fullName: fullName ?? this.fullName,
      id: id ?? this.id,
    );
  }

  factory RegistracionGetModel.fromJson(Map<String, dynamic> json) {
    return RegistracionGetModel(
      email: json["email"],
      username: json["username"],
      emailConfirmed: json["email_confirmed"],
      verificationCode: json["verification_code"],
      registerTime: DateTime.tryParse(json["register_time"] ?? ""),
      isActive: json["is_active"],
      isSuperuser: json["is_superuser"],
      fullName: json["full_name"],
      id: json["id"],
    );
  }
}
