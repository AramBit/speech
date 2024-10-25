import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_live_project/data/model/sign_in_get_model.dart';
import 'package:video_live_project/data/model/sign_in_send_model.dart';
import 'package:video_live_project/domain/signInCubit/sign_in_state.dart';

import '../../data/api/request_services.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInState());
  void passwordIsShow() {
    emit(
      state.coppyWidth(
        getEyeIsActive: !state.eyeIsActive,
      ),
    );
  }

  void showButton() {
    if (SignInState.emailController.text.isNotEmpty &&
        SignInState.passwordController.text.length >= 8) {
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

  void signIn(BuildContext context) {
    if (state.allFieldIsValide) {
      SignInServices.signInUser(SignInSendModel(
        email: SignInState.emailController.text,
        password: SignInState.passwordController.text,
      )).then((SignInGetModel? response) {
        if (response != null) {
          Navigator.pushNamed(
            context,
            'home_page',
            arguments: response,
          );
        }
      });
    }
  }
}
