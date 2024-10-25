import 'package:flutter/material.dart';
import 'pattern_text_widget.dart';

class TextFieldGlobal extends StatelessWidget {
  const TextFieldGlobal({
    super.key,
    required this.text,
    this.textSize = 13,
    required this.textColor,
    this.sufixIcon,
    this.contentPaddingHor = 10,
    this.contentPaddingVer = 15,
    required this.borderColor,
    this.borderRadius = 6,
    this.controller,
    this.onChange,
    this.passwordIsShow = false,
    this.sufixMaxWidth = 30.27,
    this.sufixMaxHeight = 30.27,
  });
  final String text;
  final double textSize;
  final Color textColor;
  final Widget? sufixIcon;
  final double contentPaddingHor;
  final double contentPaddingVer;
  final double borderRadius;
  final Color borderColor;
  final TextEditingController? controller;
  final Function(String value)? onChange;
  final bool passwordIsShow;
  final double sufixMaxWidth;
  final double sufixMaxHeight;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: passwordIsShow,
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
        label: PatternTextWidget(
          text: text,
          fontSize: textSize,
          color: textColor,
        ),
        suffixIcon: sufixIcon ?? const SizedBox(),
        suffixIconConstraints:  BoxConstraints(
          maxWidth: sufixMaxWidth,
          maxHeight: sufixMaxHeight,
        ),

        // constraints: const BoxConstraints(
        //     // maxHeight: 60,
        //     ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: contentPaddingHor,
          vertical: contentPaddingVer,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
          borderSide: BorderSide(
            color: borderColor,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
          borderSide: BorderSide(
            color: borderColor,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
          borderSide: BorderSide(
            color: borderColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
