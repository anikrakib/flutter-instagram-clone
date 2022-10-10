import 'package:flutter/material.dart';
import '../theme.dart';

TextFormField usernameOrPasswordTextField(String hints, bool textSecure, [TextEditingController? controller]) {
  return TextFormField(
    controller: controller,
    onSaved: (input) => print(input),
    onChanged: (text){
      controller?.value = controller.value.copyWith(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    },
    keyboardType:
        textSecure ? TextInputType.visiblePassword : TextInputType.emailAddress,
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
    ),
    obscureText: textSecure,
    enableSuggestions: false,
    autocorrect: false,
  );
}
