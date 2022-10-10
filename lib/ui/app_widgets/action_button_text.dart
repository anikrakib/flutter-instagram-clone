import 'package:flutter/material.dart';
import '../theme.dart';

Text actionButtonText(String text, bool emptyOrNot) {
  return Text(
    text,
    style: emptyOrNot == true
        ? AppTextStyle.textStyleBoldMediumWhiteText
        : AppTextStyle.textStyleBoldMedium,
  );
}