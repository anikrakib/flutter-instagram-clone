import 'dart:math';
import 'package:faker/faker.dart';
import 'package:instagram_clone/app/model/comment_model.dart';
import 'package:instagram_clone/app/model/comment_owner.dart';

var faker = Faker();
var random = Random();

List<Comment> generateComments(){
  return List<Comment>.generate(random.nextInt(50), (index) {
    String menOrWomen = random.nextBool() == true ? 'women' : 'men';
    return Comment(
      createdTime: '',
      commentOwner: CommentOwner(
        fullName: '${faker.person.firstName()} ${faker.person.lastName()}',
        profilePicture: 'https://randomuser.me/api/portraits/$menOrWomen/$index.jpg',
        username: faker.internet.userName(),
      ),
      comment: faker.lorem.sentence(),
    );
  });
}