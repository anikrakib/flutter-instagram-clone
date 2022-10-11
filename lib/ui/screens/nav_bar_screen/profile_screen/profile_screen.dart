import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram_clone/app/controller/signup_controller.dart';
import 'package:instagram_clone/routes/app_routes.dart';
import '../../../../app/controller/theme_controller.dart';
import '../../../../utils/constants.dart';
import '../../../theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final signUpController = Get.put(SignUpController());
  final themeController = Get.find<ThemeController>();

  final userInfo = GetStorage();
  String uName = '';
  String password = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    if (userInfo.read(userNameKey) != null &&
        userInfo.read(passwordKey) != null &&
        userInfo.read(emailKey) != null) {
      uName = userInfo.read(userNameKey);
      password = userInfo.read(passwordKey);
      email = userInfo.read(emailKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INSTAGRAM'),
        actions: [
          IconButton(
            onPressed: () {
              if (Get.isDarkMode) {
                themeController.changeTheme(AppTheme().lightTheme);
                themeController.saveTheme(false);
              } else {
                themeController.changeTheme(AppTheme().darkTheme);
                themeController.saveTheme(true);
              }
            },
            icon: Get.isDarkMode
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Username: ${userInfo.read(userNameKey)}'),
            Text('Password: ${userInfo.read(passwordKey)}'),
            Text('Email: ${userInfo.read(emailKey)}'),
            Text('Phone: +880 ${userInfo.read(phoneKey)}'),
            Text('Pic Url: ${userInfo.read(userProfilePicKey)}'),
            MaterialButton(
              child: const Text('SignOut'),
              onPressed: () {
                userInfo.write(isLoggedInKey, false);
                Get.offNamed(Routes.existingAccount);
              },
            )
          ],
        ),
      ),
    );
  }
}
