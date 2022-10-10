import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram_clone/app/instagram_clone_app.dart';
import 'package:instagram_clone/ui/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  /*await GetStorage.init('username');
  await GetStorage.init('password');*/
  await GetStorage.init();
  //await Get.putAsync(() => UserInfoService().init());
  final theme = AppTheme();
  runApp(InstagramCloneApp(appTheme: theme));
}
