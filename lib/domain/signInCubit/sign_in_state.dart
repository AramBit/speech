import 'package:flutter/material.dart';

class SignInState {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  bool allFieldIsValide;
  bool eyeIsActive;

  SignInState({
    this.allFieldIsValide = false,
    this.eyeIsActive = true,
  });

  SignInState coppyWidth({
    bool? getAllFieldIsValide,
    bool? getEyeIsActive,
  }) {
    return SignInState(
      allFieldIsValide: getAllFieldIsValide ?? allFieldIsValide,
      eyeIsActive: getEyeIsActive ?? eyeIsActive,
    );
  }
}
