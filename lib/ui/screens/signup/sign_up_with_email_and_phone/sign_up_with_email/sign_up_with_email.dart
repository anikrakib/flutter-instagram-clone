import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/controller/signup_controller.dart';
import 'package:instagram_clone/utils/constants.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../app_widgets/action_button_text.dart';
import '../../../../app_widgets/custom_action_button.dart';
import '../../../../app_widgets/input_text_field_decoration.dart';
import '../../../../app_widgets/widgets.dart';
import '../../validator/validator.dart';

class SignUpWithEmail extends StatelessWidget {
  SignUpWithEmail({Key? key}) : super(key: key);
  final signUpController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
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
                    actionButtonText('Next', empty),
                    empty,
                    action,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  action() {
    Get.toNamed(Routes.otherInformation);
  }
}
