import 'package:flutter/material.dart';

class RegistrationVerificationState {
  static TextEditingController pinController = TextEditingController();
  bool isLoad;
  bool error;
  int repeatCodeIndex;
  bool repeatCode;

  RegistrationVerificationState({
    this.isLoad = false,
    this.error = false,
    this.repeatCodeIndex = 59,
    this.repeatCode = false,
  });

  RegistrationVerificationState coppyWidth({
    bool? getisLoad,
    bool? geterror,
    int? getrepeatCodeIndex,
    bool? getrepeatCode,
  }) {
    return RegistrationVerificationState(
      isLoad: getisLoad ?? isLoad,
      error: geterror ?? error,
      repeatCodeIndex: getrepeatCodeIndex ?? repeatCodeIndex,
      repeatCode: getrepeatCode ?? repeatCode,
    );
  }
}
