import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../uiConstants/ui_colors.dart';

class MicrophoneVoiceBox extends StatelessWidget {
  const MicrophoneVoiceBox({
    super.key,
    required this.onTapMicrophone,
    required this.onTapVoice,
  });
  final Function()? onTapMicrophone;
  final Function()? onTapVoice;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 3.5,
      ),
      width: 70,
      height: 30,
      decoration: BoxDecoration(
        color: UiColors.uiBlack.withOpacity(
          0.4,
        ),
        borderRadius: BorderRadius.circular(
          50,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: onTapMicrophone,
            child: Image.asset(
              'assets/icons/microphone-slash.png',
              width: 16,
            ),
          ),
          GestureDetector(
            onTap: onTapVoice,
            child: Image.asset(
              'assets/icons/voice.png',
              width: 16,
            ),
          ),
        ],
      ),
    );
  }
}
