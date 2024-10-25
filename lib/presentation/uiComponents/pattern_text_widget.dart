import 'package:flutter/material.dart';

class PatternTextWidget extends StatelessWidget {
  const PatternTextWidget({
    super.key,
    required this.text,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w400,
    this.color = Colors.white,
    this.paddingTop = 0,
    this.paddingBottom = 0,
    this.paddingLeft = 0,
    this.paddingRight = 0,
    this.textOverflow = TextOverflow.ellipsis,
  });
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final TextOverflow? textOverflow;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop,
        bottom: paddingBottom,
        left: paddingLeft,
        right: paddingRight,
      ),
      child: Text(
        textAlign: TextAlign.center,
        text,
        overflow: textOverflow,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            fontFamily: 'Inter'),
      ),
    );
  }
}
