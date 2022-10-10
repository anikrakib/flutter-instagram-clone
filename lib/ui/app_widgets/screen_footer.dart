import 'package:flutter/material.dart';
import '../theme.dart';

Column bottomPart(Widget textWidget) {
  return Column(
    children: [
      Container(
        width: double.infinity,
        height: .8,
        color: AppColors.faded,
      ),
      SizedBox(
        height: 56,
        child: Center(
          child: textWidget,
        ),
      ),
    ],
  );
}