import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/ui/app_widgets/sizeBox.dart';
import 'package:instagram_clone/ui/screens/signup/validator/validator.dart';
import 'package:instagram_clone/ui/theme.dart';
import 'package:instagram_clone/utils/constants.dart';
import '../../../../../app/controller/signup_controller.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../app_widgets/action_button_text.dart';
import '../../../../app_widgets/custom_action_button.dart';

class SignUpWithPhone extends StatelessWidget {
  SignUpWithPhone({Key? key}) : super(key: key);
  final signUpController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              phoneNumberPart(),
              sizeBox(20),
              const Text(
                'You may receive SMS updates from Instagram and can opt out at any time',
                style: AppTextStyle.textStyleFadedSmall,
                textAlign: TextAlign.center,
              ),
              sizeBox(20),
              Obx(
                () {
                  bool empty = (signUpController.phoneNumberNotEmpty.value);
                  return customActionButton(
                    actionButtonText('Next', empty),
                    empty,
                    action,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  action() {
    Get.toNamed(Routes.otherInformation);
  }

  Container phoneNumberPart() {
    return Container(
      padding: const EdgeInsets.only(right: 16, left: 16),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? const Color(0xFF121212) : AppColors.lightGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Text(
            'BD +880',
            style: AppTextStyle.textStyleBold,
          ),
          sizeBox(10),
          Container(
            width: 1,
            height: 25,
            color: AppColors.faded,
          ),
          sizeBox(10),
          Expanded(
            child: TextField(
              controller: signUpController.phoneNumberController,
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(
                hintText: 'Phone',
                hintStyle: TextStyle(fontSize: 14, color: AppColors.faded),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
              onChanged: (value) {
                signUpController.updatePhoneNumber(
                    value, Validator.validateMobile(value));
              },
            ),
          )
        ],
      ),
    );
  }
}
