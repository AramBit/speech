import 'package:flutter/material.dart';

import '../uiConstants/ui_colors.dart';
import 'pattern_text_widget.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(
            right: 5,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: UiColors.uiCommentAvatarBackground,
            borderRadius: BorderRadius.circular(
              50,
            ),
          ),
          width: 28,
          height: 28,
          child: const PatternTextWidget(
            text: 'АС',
            fontSize: 11,
          ),
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PatternTextWidget(
              text: 'artsolovevru',
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
            PatternTextWidget(
              text: 'Аватарка пользователя не загрузилась',
              fontSize: 13,
            ),
          ],
        ),
      ],
    );
  }
}
