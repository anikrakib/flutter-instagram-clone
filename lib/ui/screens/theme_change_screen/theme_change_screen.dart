import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/ui/app_widgets/widgets.dart';
import 'package:instagram_clone/utils/constants.dart';
import '../../../app/controller/theme_controller.dart';
import '../../../generated/assets.dart';
import '../../app_widgets/app_image.dart';
import '../../theme.dart';

enum ThemeType { light, dark, system }

class ThemeChangeScreen extends StatefulWidget {
  const ThemeChangeScreen({Key? key}) : super(key: key);

  @override
  State<ThemeChangeScreen> createState() => _ThemeChangeScreenState();
}

class _ThemeChangeScreenState extends State<ThemeChangeScreen> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Theme'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Light',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  CustomRadio(
                    value: ThemeMode.light,
                    onChange: (ThemeMode? value) {
                      setState(() {
                        _themeMode = value!;
                      });
                      //themeController.changeCurrentTheme(value!);
                    },
                  )
                ],
              ),
              sizeBox(20),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Dark',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  CustomRadio(
                    value: ThemeMode.dark,
                    onChange: (ThemeMode? value) {
                      setState(() {
                        _themeMode = value!;
                      });
                      //themeController.changeCurrentTheme(value!);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomRadio extends StatefulWidget {
  CustomRadio({
    Key? key,
    required this.value,
    this.onChange,
  }) : super(key: key);
  ThemeMode value;
  void Function(ThemeMode?)? onChange;

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bool selected = widget.value != themeController.theme;
        if (selected) {
          widget.onChange!(widget.value);
          if (Get.isDarkMode) {
            themeController.changeTheme(AppTheme().lightTheme);
            themeController.saveTheme(false);
          } else {
            themeController.changeTheme(AppTheme().darkTheme);
            themeController.saveTheme(true);
          }
        }
      },
      child: (themeController.theme == widget.value)
          ? svgImageWithHeightAndWidth(
              25,
              25,
              Assets.iconsIconRadioSelected,
            )
          : Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  width: 2,
                  color: AppColors.faded,
                ),
              ),
            ),
    );
  }
}
