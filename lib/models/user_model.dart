// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? username, password, email, createdAt, updatedAt;
  bool? isOld;
  UserModel(
      {required this.username,
      required this.password,
      this.email,
      this.isOld,
      this.createdAt,
      this.updatedAt});
  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    email = json['email'];
    isOld = json['isOld'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['isOld'] = this.isOld;
    return data;
  }

  UserModel copyWith({String? username, password, email}) {
    return UserModel(
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }
}
