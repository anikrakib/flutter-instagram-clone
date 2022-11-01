import 'dart:math';
import 'package:faker/faker.dart';
import 'package:instagram_clone/app/data/comment_data.dart';
import 'package:instagram_clone/app/data/story_data.dart';
import 'package:instagram_clone/app/data/user_data.dart';
import '../../utils/utils_function.dart';
import '../model/explore_data_model.dart';

var faker = Faker();

var lst = reelsIndexNumb(55);

var explorerList = List<SearchListItem>.generate(
  55,
  (index) {
    var random = Random();
    if (lst.contains(index)) {
      return ReelItem(
        reelUser: generateUser(),
        reelUrl: videoStories[random.nextInt(videoStories.length)].url,
        reelMusicName: faker.lorem.sentence(),
        comments: generateComments(),
        reelPostBody: random.nextBool() == true ? faker.lorem.sentence() : '',
      );
    } else {
      return random.nextBool()
          ? ImageItem(
              user: generateUser(),
              images: generateImages(),
              comments: generateComments(),
              postBody: random.nextBool() == true ? faker.lorem.sentence() : '',
            )
          : VideoItem(
              videoPostBody:
                  random.nextBool() == true ? faker.lorem.sentence() : '',
              videoUser: generateUser(),
              videoUrl: videoStories[random.nextInt(videoStories.length)].url,
              comments: generateComments(),
            );
    }
  },
);

var reelsList = List<ReelItem>.generate(
  videoStories.length,
  (index) {
    return ReelItem(
      reelUser: generateUser(),
      reelUrl: videoStories[index].url,
      reelMusicName: faker.lorem.sentence(),
      comments: generateComments(),
      reelPostBody: Random().nextBool() == true ? faker.lorem.sentence() : '',
    );
  },
);
