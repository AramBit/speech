import 'package:flutter/material.dart';

import '../uiConstants/ui_colors.dart';
import 'pattern_text_widget.dart';

class AppTopBar extends StatelessWidget {
  const AppTopBar({
    super.key,
    required this.onTap,
    required this.text,
    this.leftWidget,
    this.rightWidget,
  });
  final Function()? onTap;
  final String text;
  final Widget? leftWidget;
  final Widget? rightWidget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 26,
        left: 26,
        right: 26,
      ),
      child: Row(
        children: [
          leftWidget != null
              ? GestureDetector(
                  onTap: onTap,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: leftWidget,
                  ),
                )
              : const SizedBox(),
          Expanded(
            child: Center(
              child: PatternTextWidget(
                text: text,
                fontSize: 20,
                color: UiColors.mainTextColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          rightWidget != null ? const SizedBox() : const SizedBox(),
        ],
      ),
    );
  }
}
