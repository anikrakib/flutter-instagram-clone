import 'package:flutter/material.dart';
import '../../../../app_widgets/button.dart';
import '../../../../app_widgets/input_text_field_decoration.dart';

class SearchProductScreen extends StatelessWidget {
  const SearchProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customButton(
          widget: TextField(
            keyboardType: TextInputType.text,
            decoration: inputTextFieldDecoration('Search shops'),
            obscureText: false,
            enableSuggestions: false,
            autocorrect: false,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
