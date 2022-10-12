import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';
import '../ui/theme.dart';
import 'controller/theme_controller.dart';

class InstagramCloneApp extends StatelessWidget {
  InstagramCloneApp({Key? key, required this.appTheme}) : super(key: key);
  /// App's theme data.
  final AppTheme appTheme;
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
      title: 'Instagram Clone',
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      themeMode: themeController.theme,
    );
  }
}
