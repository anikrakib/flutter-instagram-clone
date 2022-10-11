import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../theme.dart';

Column bottomPart(Widget widget) {
  return Column(
    children: [
      Container(
        width: double.infinity,
        height: .8,
        color: AppColors.faded,
      ),
      SizedBox(
        height: appBarHeight,
        child: Center(
          child: widget,
        ),
      ),
    ],
  );
}