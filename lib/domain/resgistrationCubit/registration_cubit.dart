import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_live_project/data/model/registration_send_model.dart';
import 'package:video_live_project/domain/resgistrationCubit/registration_state.dart';

import '../../data/api/request_services.dart';
import '../../data/model/registration_get_model.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationState());
  void userNameValidation(String value, int index) {
    if (value.isNotEmpty) {
      List<bool> getStateContainSpacesList = [];
      for (var element in state.containSpaces) {
        getStateContainSpacesList.add(element);
      }
      getStateContainSpacesList[index] = true;
      emit(
        state.coppyWidth(
          getContainSpaces: getStateContainSpacesList,
        ),
      );
    } else {
      List<bool> getStateContainSpacesList = state.containSpaces;
      getStateContainSpacesList[index] = false;
      emit(
        state.coppyWidth(
          getContainSpaces: getStateContainSpacesList,
        ),
      );
    }
  }

  void userEmailValidation(String value) {
    if (validateEmail(value) == 'complete') {
      emit(
        state.coppyWidth(
          getNameOrEamilAddress: true,
        ),
      );
    } else {
      emit(
        state.coppyWidth(
          getNameOrEamilAddress: false,
        ),
      );
    }
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isEmpty || !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : 'complete';
  }

  void userPasswordValidation(String password) {
    if (password.length >= 8) {
      emit(
        state.coppyWidth(
          getLeastEightCharacters: true,
        ),
      );
    } else {
      emit(
        state.coppyWidth(
          getLeastEightCharacters: false,
        ),
      );
    }

    String emailText = RegistrationState.emailController.text;
    String emailBeforeAt = emailText.split('@')[0];

    if (!password.contains(emailBeforeAt) &&
        !password.contains(RegistrationState.usernameController.text)) {
      emit(
        state.coppyWidth(
          getNameOrEamilAddress: true,
        ),
      );
    } else {
      emit(
        state.coppyWidth(
          getNameOrEamilAddress: false,
        ),
      );
    }

    bool hasSymbolOrNumber =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>0-9]'));
    if (hasSymbolOrNumber) {
      emit(
        state.coppyWidth(
          getLeastOneSymbolOrNumber: true,
        ),
      );
    } else {
      emit(
        state.coppyWidth(
          getLeastOneSymbolOrNumber: false,
        ),
      );
    }
    if (state.leastEightCharacters &&
        state.containSpaces[0] &&
        state.containSpaces[1] &&
        state.containSpaces[2] &&
        state.leastEightCharacters &&
        state.nameOrEamilAddress &&
        state.leastOneSymbolOrNumber) {
      emit(
        state.coppyWidth(
          getAllFieldIsValide: true,
        ),
      );
    } else {
      emit(
        state.coppyWidth(
          getAllFieldIsValide: false,
        ),
      );
    }
  }

  void passwordIsShow() {
    emit(
      state.coppyWidth(
        getEyeIsActive: !state.eyeIsActive,
      ),
    );
  }

  void registration(BuildContext context) {
    if (state.allFieldIsValide) {
      RegistrationService.registerUser(RegistrationSendModel(
        email: RegistrationState.emailController.text,
        password: RegistrationState.passwordController.text,
        fullName: RegistrationState.usernameController.text,
        username: RegistrationState.usernameController.text,
      )).then((RegistracionGetModel? response) {
        if (response != null) {
          Navigator.pushNamed(
            context,
            'registrationVerificationPage',
            arguments: response,
          );
        }
      });
    }
  }
}
