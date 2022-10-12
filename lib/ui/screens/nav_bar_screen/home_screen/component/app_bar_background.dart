import 'package:flutter/material.dart';
import '../../../../theme.dart';

Container appBarBackground(double width, Color color) {
  return Container(
    height: 3.0,
    width: width,
    decoration: BoxDecoration(
      color: color,
      border: Border.all(
        color: AppColors.faded,
        width: 0.8,
      ),
      borderRadius: BorderRadius.circular(3.0),
    ),
  );
}