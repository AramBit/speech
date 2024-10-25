import 'package:flutter/material.dart';

import '../uiConstants/ui_colors.dart';
import 'pattern_text_widget.dart';

class SpeechTextField extends StatelessWidget {
  const SpeechTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: PatternTextWidget(
          text: 'Сообщение',
          fontSize: 13,
          color: UiColors.uiInputLabelTextColor,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: Image.asset(
            'assets/icons/smile.png',
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          maxWidth: 30.27,
        ),
        fillColor: UiColors.uiSpeechInputBackgroundColor,
        filled: true,
        constraints: const BoxConstraints(
          maxHeight: 32,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            18.0,
          ),
          borderSide: BorderSide(color: UiColors.uiSpeechInputBorder, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            18.0,
          ),
          borderSide: BorderSide(color: UiColors.uiSpeechInputBorder, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            18.0,
          ),
          borderSide: BorderSide(color: UiColors.uiSpeechInputBorder, width: 1),
        ),
      ),
    );
  }
}
