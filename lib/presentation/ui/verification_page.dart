import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../data/model/registration_get_model.dart';
import '../../domain/recoverPasswordCubit/recover_password_cubit.dart';
import '../../domain/recoverPasswordCubit/recover_password_state.dart';
import '../../domain/registrationVerificationCubit/registration_verification_cubit.dart';
import '../../domain/registrationVerificationCubit/registration_verification_state.dart';
import '../uiComponents/on_boarding_button.dart';
import '../uiComponents/pattern_text_widget.dart';
import '../uiComponents/pinput.dart';
import '../uiComponents/text_field_global.dart';
import '../uiComponents/top_bar.dart';
import '../uiConstants/ui_colors.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    RecoverPasswordCubit recoverPasswordCubit =
        context.watch<RecoverPasswordCubit>();

    return Scaffold(
      backgroundColor: UiColors.uiWhite,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 26,
              bottom: 26,
            ),
            child: AppTopBar(
              onTap: () {},
              text: 'Восстановление пароля',
              leftWidget: Image.asset(
                'assets/icons/leftArrow.png',
                width: 10,
                height: 17,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                TextFieldGlobal(
                  controller: RecoverPasswordState.emailController,
                  text: 'Email',
                  textSize: 18,
                  textColor: UiColors.uiInputLabelTextColor,
                  borderColor: UiColors.uiBottomBarBorderTop.withOpacity(0.1),
                  contentPaddingVer: 17,
                  onChange: (value) {
                    recoverPasswordCubit.userEmailValidation(value);
                  },
                ),
                BlocBuilder<RecoverPasswordCubit, RecoverPasswordState>(
                    bloc: recoverPasswordCubit,
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          top: 26,
                        ),
                        child: OnBoardingButton(
                          isActive: state.allFieldIsValide,
                          text: 'Восстановить пароль',
                          onTap: () {
                            recoverPasswordCubit.recoverPassword(context);
                          },
                          backgroundColor: UiColors.uiBottomBarItem,
                          paddingVer: 20,
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
