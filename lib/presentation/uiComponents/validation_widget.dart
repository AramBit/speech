import 'package:flutter/material.dart';
import 'package:video_live_project/presentation/uiComponents/pattern_text_widget.dart';
import 'package:video_live_project/presentation/uiConstants/ui_colors.dart';

class ValidationWidget extends StatelessWidget {
  const ValidationWidget({
    super.key,
    required this.text,
    required this.image,
  });
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 24,
          ),
          const SizedBox(
            width: 6,
          ),
          PatternTextWidget(
            text: text,
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: UiColors.uiBlack,
          ),
        ],
      ),
    );
  }
}
