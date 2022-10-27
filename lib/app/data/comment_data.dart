import 'dart:math';
import 'package:faker/faker.dart';
import 'package:instagram_clone/app/data/story_data.dart';
import 'package:instagram_clone/app/model/comment_model.dart';
import '../model/story_model.dart';
import '../model/user_model.dart';

var faker = Faker();
var random = Random();

List<Comment> generateComments() {
  return List<Comment>.generate(
    random.nextInt(50),
    (index) {
      String menOrWomen = random.nextBool() == true ? 'women' : 'men';
      return Comment(
        createdTime: '${random.nextInt(11)+1}h',
        commentOwner: User(
          verified: random.nextBool(),
          userName: faker.internet.userName(),
          profileImageUrl:
              'https://randomuser.me/api/portraits/$menOrWomen/${index + 10}.jpg',
          bio: faker.lorem.sentence(),
          fullName: '${faker.person.firstName()} ${faker.person.lastName()}',
          stories: List<Story>.generate(
            (random.nextInt(9) + 1),
            (storyIndex) {
              if (random.nextBool() == true) {
                return Story(
                  url: videoStories[storyIndex].url,
                  media: MediaType.video,
                  duration: videoStories[storyIndex].duration,
                );
              } else {
                return Story(
                  url: 'https://source.unsplash.com/random?sig=$storyIndex',
                  media: MediaType.image,
                  duration: const Duration(seconds: 10),
                );
              }
            },
          ),
        ),
        comment: faker.lorem.sentence(),
      );
    },
  );
}
