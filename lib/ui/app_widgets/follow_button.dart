import 'package:flutter/material.dart';

import '../theme.dart';

ElevatedButton followButton([Color? color]) {
  return ElevatedButton(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(
        color ?? AppColors.light,
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        (color == null) ? AppColors.secondary : Colors.transparent,
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: color ?? AppColors.secondary,
          ),
        ),
      ),
    ),
    onPressed: () => {},
    child: Text(
      "Follow".toUpperCase(),
      style: const TextStyle(fontSize: 12,),
    ),
  );
}