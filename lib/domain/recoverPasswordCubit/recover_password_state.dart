import 'package:flutter/material.dart';

class RecoverPasswordState {
  static TextEditingController emailController = TextEditingController();
  static PageController pageController = PageController();

  static TextEditingController pinController = TextEditingController();
  bool allFieldIsValide;
  bool nameOrEamilAddress;

  RecoverPasswordState({
    this.allFieldIsValide = false,
    this.nameOrEamilAddress = false,
  });

  RecoverPasswordState coppyWidth({
    bool? getAllFieldIsValide,
    bool? getNameOrEamilAddress,
  }) {
    return RecoverPasswordState(
      allFieldIsValide: getAllFieldIsValide ?? allFieldIsValide,
      nameOrEamilAddress: getNameOrEamilAddress ?? nameOrEamilAddress,
    );
  }
}
