import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instagram_clone/app/controller/signup_controller.dart';
import 'package:instagram_clone/routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final signUpController = Get.find<SignUpController>();
  final userInfo = GetStorage();
  String uName = '';
  String password = '';
  String email = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (userInfo.read('userName') != null &&
        userInfo.read('password') != null &&
        userInfo.read('email') != null) {
      uName = userInfo.read('userName');
      password = userInfo.read('password');
      email = userInfo.read('email');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INSTAGRAM'),
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            Text('Username: ${userInfo.read("userName")}'),
            Text('Password: ${userInfo.read("password")}'),
            Text('Email: ${userInfo.read("email")}'),
            Text('Phone: +880 ${userInfo.read("phone")}'),
            Text('Pic Url: ${userInfo.read("userProfilePic")}'),
            MaterialButton(
              child: const Text('SignOut'),
              onPressed: () {
                userInfo.write("isLoggedIn", false);
                Get.offNamed(Routes.EXISTINGACCOUNT);
              },
            )
          ],
        ),
      ),
    );
  }
}
