import 'dart:math';
import 'package:faker/faker.dart';
import 'package:instagram_clone/app/data/comment_data.dart';
import 'package:instagram_clone/app/data/story_data.dart';
import 'package:instagram_clone/app/data/user_data.dart';
import '../model/explore_data_model.dart';

var faker = Faker();
var lst = [2, 11, 24, 33, 46, 55, 68, 77, 90, 99, 112];

var explorerList = List<SearchListItem>.generate(
  30,
  (index) {
    var random = Random();
    var listImage = List<String>.generate(
      random.nextInt(4) + 1,
      (i) => 'https://picsum.photos/seed/image${random.nextInt(150)}/500/800',
    );

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
              images: listImage,
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
