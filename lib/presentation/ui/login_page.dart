import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_live_project/presentation/routing.dart';
import 'package:video_live_project/presentation/uiComponents/on_boarding_button.dart';

import '../../data/model/registration_get_model.dart';
import '../../domain/registrationVerificationCubit/registration_verification_cubit.dart';
import '../../domain/signInCubit/sig_in_cubit.dart';
import '../../domain/signInCubit/sign_in_state.dart';
import '../uiComponents/pattern_text_widget.dart';
import '../uiComponents/text_field_global.dart';
import '../uiComponents/top_bar.dart';
import '../uiConstants/ui_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SignInCubit signInCubit = context.watch<SignInCubit>();

    return Scaffold(
      backgroundColor: UiColors.uiWhite,
      body: ListView(
        children: [
          AppTopBar(
            onTap: () {
              Navigator.pop(context);
            },
            text: 'Вход',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 26,
            ),
            child: Column(
              children: [
                TextFieldGlobal(
                  controller: SignInState.emailController,
                  text: 'Email или username',
                  textColor: UiColors.uiInputLabelTextColor,
                  borderColor: UiColors.uiBottomBarBorderTop.withOpacity(0.1),
                  onChange: (value) {
                    signInCubit.showButton();
                  },
                ),
                BlocBuilder<SignInCubit, SignInState>(
                    bloc: signInCubit,
                    builder: (context, state) {
                      return Column(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: TextFieldGlobal(
                                  passwordIsShow: state.eyeIsActive,
                                  text: 'Пароль',
                                  controller: SignInState.passwordController,
                                  textColor: UiColors.uiInputLabelTextColor,
                                  borderColor: UiColors.uiBottomBarBorderTop
                                      .withOpacity(0.1),
                                  onChange: (value) {
                                    signInCubit.showButton();
                                  },
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: 0,
                                bottom: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    // registrationCubit.passwordIsShow();
                                    signInCubit.passwordIsShow();
                                  },
                                  child: Image.asset(
                                    state.eyeIsActive
                                        ? 'assets/icons/eye-off.png'
                                        : 'assets/icons/eye-empty.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  'verificationPage',
                                  arguments: RegistracionGetModel(
                                    email: SignInState.emailController.text,
                                  ),
                                );
                              },
                              child: PatternTextWidget(
                                text: 'Забыли пароль?',
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: UiColors.uiBottomBarItem,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          OnBoardingButton(
                            backgroundColor: UiColors.inactiveBackColor,
                            text: 'Войти',
                            isActive: state.allFieldIsValide,
                            onTap: () {
                              signInCubit.signIn(context);
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.398,
                          ),
                          GestureDetector(
                            onTap: () {
                              AppRouting().navigationToPage(
                                  context, 'registracionPage', true);
                            },
                            child: PatternTextWidget(
                              text: 'Зарегистрироваться',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: UiColors.uiBottomBarItem,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
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
