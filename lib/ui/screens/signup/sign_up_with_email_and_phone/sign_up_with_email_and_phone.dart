import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/ui/app_widgets/sizeBox.dart';
import 'package:instagram_clone/ui/screens/signup/sign_up_with_email_and_phone/sign_up_with_email/sign_up_with_email.dart';
import 'package:instagram_clone/ui/screens/signup/sign_up_with_email_and_phone/signup_with_phone/sign_up_with_phone.dart';
import '../../../../generated/assets.dart';
import '../../../app_widgets/app_image.dart';
import '../../../app_widgets/screen_footer.dart';
import '../../../theme.dart';
import '../../../app_widgets/custom_text.dart';

class SignUpWithEmailAndPhone extends StatefulWidget {
  const SignUpWithEmailAndPhone({Key? key}) : super(key: key);

  @override
  State<SignUpWithEmailAndPhone> createState() =>
      _SignUpWithEmailAndPhoneState();
}

class _SignUpWithEmailAndPhoneState extends State<SignUpWithEmailAndPhone>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'PHONE'),
    Tab(text: 'EMAIL'),
  ];

  static List<Widget> tabs = <Widget>[
    SignUpWithPhone(),
    SignUpWithEmail()
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      sizeBox(56),
                      Column(
                        children: [
                          userIconPart(),
                          sizeBox(20),
                          TabBar(
                            labelColor: Get.isDarkMode
                                ? AppColors.light
                                : AppColors.dark,
                            unselectedLabelColor: AppColors.faded,
                            controller: _tabController,
                            indicatorColor: Get.isDarkMode
                                ? AppColors.light
                                : AppColors.dark,
                            tabs: myTabs,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 250,
                            child: TabBarView(
                                controller: _tabController, children: tabs),
                          ),
                        ],
                      ),
                      bottomPart(
                        customText('Already have an account? ', 'Log In'),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

CircleAvatar userIconPart() {
  return CircleAvatar(
    radius: 80,
    backgroundColor: Get.isDarkMode ? AppColors.light : AppColors.dark,
    child: CircleAvatar(
      radius: 78,
      backgroundColor: Get.isDarkMode ? AppColors.dark : AppColors.light,
      child: svgImage(90, 90, Assets.iconsIconPerson),
    ),
  );
}
