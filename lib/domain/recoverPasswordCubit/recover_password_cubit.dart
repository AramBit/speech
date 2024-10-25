import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api/request_services.dart';
import '../../data/model/recover_get_model.dart';
import '../../data/model/recover_send_model.dart';
import 'recover_password_state.dart';

class RecoverPasswordCubit extends Cubit<RecoverPasswordState> {
  RecoverPasswordCubit() : super(RecoverPasswordState());

  void recoverPassword(BuildContext context) {
    if (state.allFieldIsValide) {
      RecoverPasswordServices.recoverPasswordUser(RecoverPasswordSendModel(
        email: RecoverPasswordState.emailController.text,
      )).then((RecoverPasswordGetModel? response) {
        if (response != null) {
          Navigator.pushNamed(
            context,
            'home_page',
            arguments: RecoverPasswordState.emailController.text,
          );
        }
      });
    }
  }

  void userEmailValidation(String value) {
    if (validateEmail(value) == 'complete') {
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
}
