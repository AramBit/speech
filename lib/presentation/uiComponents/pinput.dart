import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../domain/registrationVerificationCubit/registration_verification_state.dart';
import '../uiConstants/ui_colors.dart';

class PinPut extends StatelessWidget {
  const PinPut({
    super.key,
    this.controller,
    this.onChange,
    required this.state,
    required this.completed,
  });
  final TextEditingController? controller;
  final Function(String)? onChange;
  final RegistrationVerificationState state;
  final Function(String)? completed;
  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: controller,
      preFilledWidget: Text(
        '0',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: UiColors.verificationFieldColor,
        ),
      ),
      defaultPinTheme: PinTheme(
        margin: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: UiColors.verificationFieldColor,
        ),
        width: 48,
        height: 60,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: state.error
                  ? UiColors.pinPutFieldErrorColor
                  : UiColors.verificationFieldFocusBorderColor1,
              offset: const Offset(
                0.0,
                0.0,
              ),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
            BoxShadow(
              color: state.error
                  ? UiColors.pinPutFieldErrorColor
                  : UiColors.verificationFieldFocusBorderColor2.withOpacity(
                      0.5,
                    ),
              offset: const Offset(
                0.0,
                0.0,
              ),
              blurRadius: 0.0,
              spreadRadius: 4.0,
            ),
          ],
          color: UiColors.uiWhite,
          borderRadius: BorderRadius.circular(
            10,
          ),
          border: Border.all(
            width: 2,
            color: UiColors.uiBottomBarBorderTop.withOpacity(
              0.1,
            ),
          ),
        ),
      ),
      focusedPinTheme: PinTheme(
        margin: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: UiColors.verificationFieldColor,
        ),
        width: 48,
        height: 60,
        decoration: BoxDecoration(
          color: UiColors.uiWhite,
          boxShadow: [
            BoxShadow(
              color: UiColors.verificationFieldFocusBorderColor1,
              offset: const Offset(
                0.0,
                0.0,
              ),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
            BoxShadow(
              color: UiColors.verificationFieldFocusBorderColor2.withOpacity(
                0.5,
              ),
              offset: const Offset(
                0.0,
                0.0,
              ),
              blurRadius: 0.0,
              spreadRadius: 4.0,
            ),
          ],
          borderRadius: BorderRadius.circular(
            7,
          ),
          border: Border.all(
            width: 2,
            color: UiColors.verificationFieldFocusColor,
          ),
        ),
      ),

      // submittedPinTheme: submittedPinTheme,
      validator: (s) {
        return null;

        // return s == '2222' ? null : 'Pin is incorrect';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      onChanged: onChange,
      onCompleted: completed,
    );
  }
}
