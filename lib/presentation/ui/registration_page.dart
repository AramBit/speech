import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_live_project/data/model/registration_send_model.dart';
import 'package:video_live_project/data/api/request_services.dart';
import 'package:video_live_project/presentation/uiComponents/on_boarding_button.dart';
import 'package:video_live_project/presentation/uiComponents/validation_widget.dart';
import '../../domain/resgistrationCubit/registration_cubit.dart';
import '../../domain/resgistrationCubit/registration_state.dart';
import '../uiComponents/text_field_global.dart';
import '../uiComponents/top_bar.dart';
import '../uiConstants/ui_colors.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final RegistrationService _registrationService = RegistrationService();

  @override
  Widget build(BuildContext context) {
    RegistrationCubit registrationCubit = context.watch<RegistrationCubit>();
    return Scaffold(
      backgroundColor: UiColors.uiWhite,
      body: ListView(
        children: [
          AppTopBar(
            onTap: () {
              Navigator.pop(context);
            },
            text: 'Регистрация',
            leftWidget: Image.asset(
              'assets/icons/leftArrow.png',
              width: 10,
              height: 17,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 26,
            ),
            child: Column(
              children: [
                TextFieldGlobal(
                  text: 'Username',
                  controller: RegistrationState.usernameController,
                  textColor: UiColors.uiInputLabelTextColor,
                  borderColor: UiColors.uiBottomBarBorderTop.withOpacity(0.1),
                  onChange: (value) {
                    registrationCubit.userNameValidation(value, 0);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFieldGlobal(
                    text: 'Email',
                    controller: RegistrationState.emailController,
                    textColor: UiColors.uiInputLabelTextColor,
                    borderColor: UiColors.uiBottomBarBorderTop.withOpacity(0.1),
                    onChange: (value) {
                      registrationCubit.userEmailValidation(value);
                      registrationCubit.userNameValidation(value, 1);
                    },
                  ),
                ),
                BlocBuilder<RegistrationCubit, RegistrationState>(
                  bloc: registrationCubit,
                  builder: (context, state) {
                    return Column(
                      children: [
                        Stack(
                          children: [
                            TextFieldGlobal(
                              passwordIsShow: state.eyeIsActive,
                              text: 'Пароль',
                              controller: RegistrationState.passwordController,
                              textColor: UiColors.uiInputLabelTextColor,
                              borderColor: UiColors.uiBottomBarBorderTop
                                  .withOpacity(0.1),
                              onChange: (value) {
                                registrationCubit.userPasswordValidation(
                                  value,
                                );
                                registrationCubit.userNameValidation(value, 2);
                              },
                            ),
                            Positioned(
                              right: 10,
                              top: 0,
                              bottom: 0,
                              child: GestureDetector(
                                onTap: () {
                                  registrationCubit.passwordIsShow();
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
                        ValidationWidget(
                          image: state.allFieldIsValide
                              ? 'assets/icons/information_active.png'
                              : 'assets/icons/information.png',
                          text: 'Password strength: weak',
                        ),
                        if (!state.allFieldIsValide)
                          Column(
                            children: [
                              ValidationWidget(
                                image: state.leastEightCharacters
                                    ? 'assets/icons/check_black.png'
                                    : 'assets/icons/cross.png',
                                text: 'Must be at least 8 characters',
                              ),
                              ValidationWidget(
                                image: state.nameOrEamilAddress
                                    ? 'assets/icons/check_black.png'
                                    : 'assets/icons/cross.png',
                                text:
                                    'Can not include your name or email address',
                              ),
                              ValidationWidget(
                                image: state.leastOneSymbolOrNumber
                                    ? 'assets/icons/check_black.png'
                                    : 'assets/icons/cross.png',
                                text: 'Must have at least one symbol or number',
                              ),
                              ValidationWidget(
                                image: state.containSpaces[0] &&
                                        state.containSpaces[1] &&
                                        state.containSpaces[2]
                                    ? 'assets/icons/check_black.png'
                                    : 'assets/icons/cross.png',
                                text: 'Can not contain spaces',
                              ),
                            ],
                          ),
                        const SizedBox(
                          height: 16,
                        ),
                        OnBoardingButton(
                          backgroundColor: UiColors.inactiveBackColor,
                          text: 'Далее',
                          isActive: state.allFieldIsValide,
                          onTap: () {
                            registrationCubit.registration(context);
                          },
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2653,
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'By selecting Agree and continue, I agree to Dynamic \nLayers ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: UiColors.uiBlack,
                        ),
                      ),
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: UiColors.uiBottomBarItem,
                        ),
                      ),
                      TextSpan(
                        text: ', ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: UiColors.uiBlack,
                        ),
                      ),
                      TextSpan(
                        text: 'Payments Terms of Service ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: UiColors.uiBottomBarItem,
                        ),
                      ),
                      TextSpan(
                        text: '\nand ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: UiColors.uiBlack,
                        ),
                      ),
                      TextSpan(
                        text: 'Notification Policy ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: UiColors.uiBottomBarItem,
                        ),
                      ),
                      TextSpan(
                        text: 'and acknowledge the ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: UiColors.uiBlack,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: UiColors.uiBottomBarItem,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
