import 'package:flutter/material.dart';
import 'package:video_live_project/presentation/uiConstants/ui_colors.dart';

import 'pattern_text_widget.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.textColor = Colors.white,
    this.iconColor,
  });
  final String icon;
  final String text;
  final Function()? onTap;
  final Color textColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          foregroundColor: UiColors.uiBottomBarItem,
          backgroundColor: UiColors.uiTransparent,
          surfaceTintColor: UiColors.uiTransparent,
        ),
        onPressed: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 24,
              color: iconColor,
            ),
            PatternTextWidget(
              text: text,
              paddingTop: 8,
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
