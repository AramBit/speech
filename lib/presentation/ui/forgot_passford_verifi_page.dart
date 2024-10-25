import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/registration_get_model.dart';
import '../../domain/recoverPasswordCubit/recover_password_state.dart';
import '../../domain/registrationVerificationCubit/registration_verification_cubit.dart';
import '../../domain/registrationVerificationCubit/registration_verification_state.dart';
import '../uiComponents/pattern_text_widget.dart';
import '../uiComponents/pinput.dart';
import '../uiComponents/top_bar.dart';
import '../uiConstants/ui_colors.dart';

class ForgotPasswordVerifiPage extends StatelessWidget {
  const ForgotPasswordVerifiPage({super.key});

  @override
  Widget build(BuildContext context) {
    RegistrationVerificationCubit registrationVerificationCubit =
        context.watch<RegistrationVerificationCubit>();
    String email = ModalRoute.of(context)!.settings.arguments as String;
    RegistrationVerificationCubit.registracionGetModel = RegistracionGetModel(
      email: email,
    );
    return Scaffold(
      body: BlocBuilder<RegistrationVerificationCubit,
          RegistrationVerificationState>(
        bloc: registrationVerificationCubit,
        builder: (context, state) {
          RegistrationVerificationCubit.registracionGetModel =
              RegistracionGetModel(
            email: RecoverPasswordState.emailController.text,
          );
          return Column(
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
              PatternTextWidget(
                text: 'Введите 4-х значный код,',
                fontSize: 24,
                color: UiColors.mainTextColor,
                fontWeight: FontWeight.w700,
              ),
              PatternTextWidget(
                text: 'отправленный вам на',
                fontSize: 24,
                color: UiColors.mainTextColor,
                fontWeight: FontWeight.w700,
              ),
              PatternTextWidget(
                text: 'почту',
                fontSize: 24,
                color: UiColors.mainTextColor,
                fontWeight: FontWeight.w700,
              ),
              PatternTextWidget(
                text: RecoverPasswordState.emailController.text,
                fontSize: 24,
                color: UiColors.uiBottomBarItem,
                fontWeight: FontWeight.w700,
              ),
              if (state.isLoad)
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  width: 58,
                  height: 58,
                  child: CircularProgressIndicator(
                    backgroundColor: UiColors.circularIndicatorBackground,
                    color: UiColors.uiBottomBarItem,
                    strokeWidth: 8,
                    strokeCap: StrokeCap.round,
                  ),
                ),
              if (!state.isLoad)
                Padding(
                  padding: const EdgeInsets.only(
                    top: 26,
                    bottom: 10,
                  ),
                  child: PinPut(
                    state: state,
                    controller: RegistrationVerificationState.pinController,
                    onChange: (value) {},
                    completed: (value) {
                      registrationVerificationCubit.sendConfirm(
                        value,
                        context,
                      );
                    },
                  ),
                ),
              if (state.error && !state.isLoad)
                PatternTextWidget(
                  text: 'Код введен неверно',
                  textOverflow: null,
                  fontSize: 13,
                  color: UiColors.pinputIncorrectTextColor,
                ),
              const SizedBox(
                height: 35,
              ),
              if (!state.repeatCode)
                PatternTextWidget(
                  text:
                      'Повтроно отправить код, можно будет через ${state.repeatCodeIndex} секунд',
                  textOverflow: null,
                  fontSize: 13,
                  color: UiColors.verificationTextCorrectTextColor,
                ),
              if (state.repeatCode)
                GestureDetector(
                  onTap: () {
                    registrationVerificationCubit.repeatCode();
                  },
                  child: PatternTextWidget(
                    text: 'Отправть код еще раз',
                    textOverflow: null,
                    fontSize: 13,
                    color: UiColors.uiBottomBarItem,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
