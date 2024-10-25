import 'package:flutter/material.dart';
import 'package:video_live_project/presentation/uiConstants/ui_colors.dart';
import 'pattern_text_widget.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    super.key,
    required this.text,
    required this.onTap,
    this.textColor = Colors.white,
    this.radius = 24,
    required this.backgroundColor,
    this.isActive = false,
    this.paddingHor = 0,
    this.paddingVer = 15,
    this.alignmentGeometry = Alignment.center,
  });
  final String text;
  final Color textColor;
  final Function()? onTap;
  final double radius;
  final Color backgroundColor;
  final bool isActive;
  final double paddingHor;
  final double paddingVer;
  final AlignmentGeometry alignmentGeometry;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: alignmentGeometry,
        padding: EdgeInsets.symmetric(
          horizontal: paddingHor,
          vertical: paddingVer,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            radius,
          ),
          color: isActive
              ? UiColors.uiBottomBarItem
              : backgroundColor.withOpacity(
                  0.3,
                ),
        ),
        child: PatternTextWidget(
          text: text,
          fontSize: 15,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
