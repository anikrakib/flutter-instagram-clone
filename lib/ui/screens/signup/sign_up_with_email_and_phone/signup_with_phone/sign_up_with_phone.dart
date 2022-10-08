import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/ui/app_widgets/sizeBox.dart';
import 'package:instagram_clone/ui/theme.dart';

import '../../../../app_widgets/custom_action_button.dart';

class SignUpWithPhone extends StatefulWidget {
  const SignUpWithPhone({Key? key}) : super(key: key);

  @override
  State<SignUpWithPhone> createState() => _SignUpWithPhoneState();
}

class _SignUpWithPhoneState extends State<SignUpWithPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
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
              customActionButton(const Text('Next'), false)
            ],
          ),
        ),
      ),
    );
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
          const Expanded(
            child: TextField(
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                hintText: 'Phone',
                hintStyle: TextStyle(fontSize: 14, color: AppColors.faded),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
