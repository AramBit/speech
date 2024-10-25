import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_live_project/presentation/uiComponents/on_boarding_button.dart';
import 'package:video_live_project/presentation/uiComponents/validation_widget.dart';

import '../uiComponents/pattern_text_widget.dart';
import '../uiComponents/text_field_global.dart';
import '../uiComponents/top_bar.dart';
import '../uiConstants/ui_colors.dart';

class PhotoAdPage extends StatelessWidget {
  const PhotoAdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.uiWhite,
      body: ListView(
        children: [
          AppTopBar(
            onTap: () {},
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
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/icons/avatar_add.png',
                    width: 164,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                PatternTextWidget(
                  text: 'Эту фотографию будут видеть',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: UiColors.uiBlack,
                ),
                PatternTextWidget(
                  text: 'другие пользователи',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: UiColors.uiBlack,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: OnBoardingButton(
                    backgroundColor: UiColors.inactiveBackColor,
                    text: 'Далее',
                    onTap: () {},
                  ),
                ),
                OnBoardingButton(
                  backgroundColor: UiColors.bottomColor,
                  text: 'Загрузить позже',
                  textColor: UiColors.uiBottomBarItem,
                  onTap: () {},
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
