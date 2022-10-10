import 'package:flutter/material.dart';
import 'package:instagram_clone/app/instagram_clone_app.dart';
import 'package:instagram_clone/ui/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final theme = AppTheme();
  runApp(InstagramCloneApp(appTheme: theme));
}
