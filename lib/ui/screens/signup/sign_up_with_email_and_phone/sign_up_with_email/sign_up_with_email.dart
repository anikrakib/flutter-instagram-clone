import 'package:flutter/material.dart';
import '../../../../app_widgets/custom_action_button.dart';
import '../../../../app_widgets/sizeBox.dart';
import '../../../signin/component/custom_text_field.dart';

class SignUpWithEmail extends StatelessWidget {
  const SignUpWithEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(children: [
            usernameOrPasswordTextField('Email', false),
            sizeBox(20),
            customActionButton(const Text('Next'), false)
          ]),
        ),
      ),
    );
  }
}
