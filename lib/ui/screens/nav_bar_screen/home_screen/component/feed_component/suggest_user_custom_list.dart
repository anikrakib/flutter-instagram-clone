import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../app/model/view_type.dart';
import '../../../../../app_widgets/suggest_user_custom_tile.dart';
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
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var suggestUser in suggestUser)
                  suggestUserCustomListTile(suggestUser)
              ],
            ),
          ),
        )
      ],
    );
  }
}
