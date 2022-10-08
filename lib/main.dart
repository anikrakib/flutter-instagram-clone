import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/ui/theme.dart';
import 'package:instagram_clone/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Instagram Clone',
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
