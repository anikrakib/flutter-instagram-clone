import 'package:flutter/material.dart';
import '../../../theme.dart';

TextField usernameOrPasswordTextField(String hints, bool textSecure) {
  return TextField(
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      hintText: hints,
      hintStyle: const TextStyle(fontSize: 14, color: AppColors.faded),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      filled: true,
       contentPadding: const EdgeInsets.all(18),
      //fillColor: AppColors.grey,
    ),
    obscureText: textSecure,
    enableSuggestions: false,
    autocorrect: false,
  );
}