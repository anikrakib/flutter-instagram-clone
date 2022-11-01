import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../app/model/view_type.dart';
import '../../../../../app_widgets/follow_button.dart';
import '../../../../../theme.dart';

class SuggestUserWidget extends StatelessWidget {
  const SuggestUserWidget({Key? key, required this.suggestUser})
      : super(key: key);
  final List<SuggestUser> suggestUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16.0),
          child: Text(
            'Suggested User',
            style: AppTextStyle.textStyleBold,
          ),
        ),
        /*ListView.builder(
          itemCount: suggestUser.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return suggestUserCustomListTile(suggestUser[index]);
          },
        ),*/
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [for (var i in suggestUser) suggestUserCustomListTile(i)],
          ),
        )
      ],
    );
  }

  SizedBox suggestUserCustomListTile(SuggestUser user) {
    //print("${user.userName}\n");
    return SizedBox(
      height: 250,
      width: 170,
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.only(top: 15, left: 15, bottom: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 90,
                  width: 90,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(
                      user.userImage,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  user.userName,
                  style: AppTextStyle.textStyleSmall,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 25,
                  width: 120,
                  child: followButton(),
                )
              ],
            ),
            const Positioned(
              right: 5,
              top: 5,
              child: Icon(
                CupertinoIcons.multiply,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
