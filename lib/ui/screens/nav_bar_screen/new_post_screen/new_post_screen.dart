import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/controller/user_post_controller.dart';
import '../../../../utils/constants.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final userPostController = Get.put(UserPostController());
  late String currentState;
  Color customBoxColor = Colors.black.withOpacity(0.7);
  Color textColor = Colors.white;

  @override
  void initState() {
    currentState = "POST";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: newPostPages[userPostController.currentIndex.value],
              ),
              Positioned(
                bottom: 10,
                right: 0,
                left: MediaQuery.of(context).size.width * 0.4,
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: customBoxColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                right: userPostController.listWheelPosition.value,
                left: userPostController.listWheelPosition.value,
                child: SizedBox(
                  height: 35,
                  child: Visibility(
                    visible: userPostController.showAddToStoryPage.value,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 60,
                        diameterRatio: userPostController.diameterRatio.value,
                        /*useMagnifier: true,
                        magnification: 1.5,*/
                        //* selected state is magnified
                        onSelectedItemChanged: (index) {
                          currentState = lists[index];
                          if (lists[index] == 'POST') {
                            userPostController.updateIndex(0);
                            userPostController.updateDiameterRatio(5);
                            userPostController.updateListWheelPosition(0);
                            customBoxColor = Colors.black.withOpacity(0.7);
                          } else if (lists[index] == 'STORY') {
                            userPostController.updateIndex(1);
                            userPostController.updateDiameterRatio(2);
                            userPostController.updateListWheelPosition(60);
                            customBoxColor = Colors.black.withOpacity(0);
                          } else if (lists[index] == 'REEL') {
                            userPostController.updateIndex(2);
                            userPostController.updateDiameterRatio(2);
                            userPostController.updateListWheelPosition(60);
                            customBoxColor = Colors.black.withOpacity(0);
                          } else if (lists[index] == 'LIVE') {
                            userPostController.updateIndex(3);
                            userPostController.updateDiameterRatio(2);
                            userPostController.updateListWheelPosition(60);
                            customBoxColor = Colors.black.withOpacity(0);
                          }
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: lists.length,
                          builder: (context, index) {
                            return RotatedBox(
                              quarterTurns: 1,
                              child: WheelTile(
                                lists[index],
                                currentState == lists[index]
                                    ? const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )
                                    : TextStyle(
                                        fontSize: 15,
                                        color: Colors.white.withOpacity(0.4),
                                        fontWeight: FontWeight.normal,
                                      ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WheelTile extends StatelessWidget {
  final String states;
  final TextStyle style;

  const WheelTile(this.states, this.style, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(states, textAlign: TextAlign.start, style: style),
    );
  }
}
