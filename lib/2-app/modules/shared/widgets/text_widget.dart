import 'package:flutter/material.dart';
import 'package:tractian_challenge/2-app/utils/colors.dart';
import 'package:tractian_challenge/2-app/utils/fonts.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;

  const TextWidget(
    this.text, {
    super.key,
    this.textColor,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: TextStyle(
        color: textColor ?? textStylePadrao.color,
        fontSize: fontSize ?? textStylePadrao.fontSize,
        fontWeight: fontWeight ?? textStylePadrao.fontWeight,
      ),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines ?? 10,
    );
  }

  static TextStyle textStylePadrao = TextStyle(
    color: darkBlue,
    fontSize: fontDefault,
    fontWeight: FontWeight.normal,
  );
}
