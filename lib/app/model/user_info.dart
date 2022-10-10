
class UserInfo{
  final String userName;
  final String passWord;
  final String email;

  UserInfo({required this.userName,required this.passWord,required this.email});

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    userName: json['userName'],
    passWord: json['passWord'],
    email: json['email'],
  );
  
}