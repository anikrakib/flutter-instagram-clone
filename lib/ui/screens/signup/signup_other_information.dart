import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram_clone/routes/app_routes.dart';
import 'package:instagram_clone/ui/app_widgets/sizeBox.dart';
import 'package:instagram_clone/ui/screens/signup/validator/validator.dart';
import 'package:instagram_clone/ui/theme.dart';
import '../../../app/controller/signup_controller.dart';
import '../../app_widgets/action_button_text.dart';
import '../../app_widgets/custom_action_button.dart';
import '../../app_widgets/input_text_field_decoration.dart';

class OtherInformation extends StatelessWidget {
  OtherInformation({Key? key}) : super(key: key);

  final signUpController = Get.find<SignUpController>();
  final userInfo = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(child: buildColumn(signUpController)),
        ),
      ),
    );
  }

  Column buildColumn(SignUpController signUpController) {
    return Column(
      children: [
        sizeBox(56),
        const Text(
          'ENTER CONFIRMATION CODE',
          style: AppTextStyle.textStyleBig,
        ),
        sizeBox(15),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: 'Enter the confirmation code we sent to '
                      '${signUpController.phoneNumber.value.isEmpty ? signUpController.email.value.toString() : signUpController.phoneNumber.value.toString()}',
                  style: AppTextStyle.textStyleBig),
              const TextSpan(
                text: ' Resend Code',
                style: AppTextStyle.textStyleActionBlueBig,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        sizeBox(15),
        TextField(
          controller: signUpController.confirmationCodeController,
          keyboardType: TextInputType.number,
          decoration: inputTextFieldDecoration('Confirmation Code'),
          obscureText: false,
          enableSuggestions: false,
          autocorrect: false,
          onChanged: (value) {
            signUpController.updateCode(value);
          },
        ),
        sizeBox(15),
        TextField(
          controller: signUpController.userNameController,
          keyboardType: TextInputType.name,
          decoration: inputTextFieldDecoration('Username'),
          obscureText: false,
          enableSuggestions: false,
          autocorrect: false,
          onChanged: (value) {
            signUpController.updateUserName(
                value, Validator.validateUserName(value));
          },
        ),
        sizeBox(15),
        TextField(
          controller: signUpController.passwordController,
          keyboardType: TextInputType.visiblePassword,
          decoration: inputTextFieldDecoration('Password'),
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          onChanged: (value) {
            signUpController.updatePassword(
                value, Validator.validatePassword(value));
          },
        ),
        sizeBox(15),
        TextField(
          controller: signUpController.confirmPasswordController,
          keyboardType: TextInputType.visiblePassword,
          decoration: inputTextFieldDecoration('Confirm Password'),
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          onChanged: (value) {
            signUpController.updateConfirmPassword(
                value, (value == signUpController.password.value));
          },
        ),
        sizeBox(15),
        Obx(
          () {
            bool empty = (signUpController.userNameNotEmpty.value &&
                signUpController.passwordNotEmpty.value &&
                signUpController.confirmPasswordNotEmpty.value);

            return customActionButton(
                actionButtonText('Create Account', empty), empty, action);
          },
        ),
      ],
    );
  }

  action() {
    Random random = Random();
    String url = 'https://randomuser.me/api/portraits/lego/${random.nextInt(9)}.jpg';
    userInfo.write("userName", signUpController.userName.value.toString());
    userInfo.write("password", signUpController.password.value.toString());
    userInfo.write("email", signUpController.email.value.toString());
    userInfo.write("phone", signUpController.phoneNumber.value.toString());
    userInfo.write("userProfilePic", url);
    userInfo.write("isLoggedIn", true);

    signUpController.emailController.clear();
    signUpController.phoneNumberController.clear();
    signUpController.confirmPasswordController.clear();
    signUpController.passwordController.clear();
    signUpController.userNameController.clear();

    Get.offNamed(Routes.HOME);
  }
}
