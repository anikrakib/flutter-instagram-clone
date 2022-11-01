import 'package:flutter/material.dart';
import '../../../../theme.dart';

Container progressBarBackground(double width, Color color) {
  return Container(
    height: 2.5,
    width: width,
    decoration: BoxDecoration(
      color: color,
      border: Border.all(
        color: AppColors.light.withOpacity(0.1),
        width: 0.8,
      ),
      borderRadius: BorderRadius.circular(3.0),
    ),
  );
}
