class UserModel {
  String? email;
  String? password;
  String? username;
  int? uid;

  UserModel({
    required this.email,
    required this.password,
    this.username,
    this.uid,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    username = json['username'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['username'] = username;
    data['uid'] = uid;
    return data;
  }
}
