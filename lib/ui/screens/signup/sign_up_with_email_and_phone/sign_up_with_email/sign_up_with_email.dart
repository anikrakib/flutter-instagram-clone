import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/controller/signup_controller.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../app_widgets/action_button_text.dart';
import '../../../../app_widgets/custom_action_button.dart';
import '../../../../app_widgets/input_text_field_decoration.dart';
import '../../../../app_widgets/sizeBox.dart';
import '../../validator/validator.dart';

class SignUpWithEmail extends StatelessWidget {
  SignUpWithEmail({Key? key}) : super(key: key);
  final signUpController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              TextField(
                controller: signUpController.emailController,
                keyboardType: TextInputType.visiblePassword,
                decoration: inputTextFieldDecoration('Email'),
                obscureText: false,
                enableSuggestions: false,
                autocorrect: false,
                onChanged: (value) {
                  signUpController.updateEmail(
                      value, Validator.validateEmail(value));
                },
              ),
              sizeBox(20),
              Obx(
                () {
                  bool empty = (signUpController.emailNotEmpty.value);
                  return customActionButton(
                    actionButtonText('Log In', empty),
                    empty,
                    Routes.OTHERINFORMATION,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

/*@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ValueListenableBuilder(
            valueListenable: signUpController.emailController,
            builder: (context, TextEditingValue value, __) {
              bool emptyOrNot = value.text.isNotEmpty;
              return Column(
                children: [
                  usernameOrPasswordTextField(
                      'Email', false, signUpController.emailController),
                  sizeBox(20),
                  customActionButton(actionButtonText('Next', emptyOrNot),
                      emptyOrNot, Routes.OTHERINFORMATION,action())
                ],
              );
            },
          ),
        ),
      ),
    );
  }*/
}
