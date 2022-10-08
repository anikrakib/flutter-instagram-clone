import 'package:flutter/material.dart';
import 'package:instagram_clone/ui/screens/splash_screen/splash_screen.dart';

class InstagramCloneApp extends StatelessWidget {
  const InstagramCloneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: SplashScreen(),
    );
  }
}


