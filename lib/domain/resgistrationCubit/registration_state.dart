import 'package:flutter/material.dart';

class RegistrationState {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController usernameController = TextEditingController();

  bool allFieldIsValide;
  bool leastEightCharacters;
  bool nameOrEamilAddress;
  bool leastOneSymbolOrNumber;
  List<bool> containSpaces;
  
  bool eyeIsActive;

  RegistrationState({
    this.allFieldIsValide = false,
    this.leastEightCharacters = false,
    this.nameOrEamilAddress = false,
    this.leastOneSymbolOrNumber = false,
    this.containSpaces = const [false, false, false],
   
    this.eyeIsActive = true,
  });

  RegistrationState coppyWidth({
    bool? getAllFieldIsValide,
    bool? getLeastEightCharacters,
    bool? getNameOrEamilAddress,
    bool? getLeastOneSymbolOrNumber,
    List<bool>? getContainSpaces,
    
    bool? getEyeIsActive,
  }) {
    return RegistrationState(
      allFieldIsValide: getAllFieldIsValide ?? allFieldIsValide,
      leastEightCharacters: getLeastEightCharacters ?? leastEightCharacters,
      nameOrEamilAddress: getNameOrEamilAddress ?? nameOrEamilAddress,
      leastOneSymbolOrNumber:
          getLeastOneSymbolOrNumber ?? leastOneSymbolOrNumber,
      containSpaces: getContainSpaces ?? containSpaces,
   
      eyeIsActive: getEyeIsActive ?? eyeIsActive,
    );
  }
}
