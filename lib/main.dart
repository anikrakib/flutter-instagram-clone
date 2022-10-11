import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram_clone/app/instagram_clone_app.dart';
import 'package:instagram_clone/ui/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final theme = AppTheme();
  runApp(InstagramCloneApp(appTheme: theme));
}
