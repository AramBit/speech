import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:video_live_project/data/model/confirm_model.dart';
import '../../data/api/request_services.dart';
import '../../data/model/registration_get_model.dart';
import 'registration_verification_state.dart';

class RegistrationVerificationCubit
    extends Cubit<RegistrationVerificationState> {
  RegistrationVerificationCubit() : super(RegistrationVerificationState()) {
    repeatTimeDecrement();
  }
  static RegistracionGetModel? registracionGetModel;
  void pinValidation(String value) {
    RegistrationVerificationState.pinController;
  }

  Future<void> sendConfirm(String value, BuildContext context) async {
    emit(
      state.coppyWidth(getisLoad: true),
    );
    await RegistrationService.confirmUser(
      ConfirmModel(
        email: registracionGetModel!.email!,
        verificationCode: int.parse(value),
      ),
    ).then((response) {
      if (response) {
        emit(
          state.coppyWidth(
            getisLoad: false,
            geterror: false,
          ),
        );
        Navigator.pushNamed(
          context,
          'home_page',
          arguments: response,
        );
      } else {
        emit(
          state.coppyWidth(
            getisLoad: false,
            geterror: true,
          ),
        );
      }
    });
  }

  void repeatTimeDecrement() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (state.repeatCodeIndex <= 0) {
        timer.cancel();
        emit(
          state.coppyWidth(
            getrepeatCode: true,
            getrepeatCodeIndex: 59,
          ),
        );
        return;
      }
      emit(
        state.coppyWidth(
          getrepeatCodeIndex: state.repeatCodeIndex - 1,
        ),
      );
    });
  }

  void repeatCode() {
    RegistrationService.retryCode(registracionGetModel!.email!)
        .then((response) {
      if (response) {
        emit(
          state.coppyWidth(
            getrepeatCodeIndex: 59,
            getrepeatCode: false,
          ),
        );
        repeatTimeDecrement();
      }
    });
  }
}
