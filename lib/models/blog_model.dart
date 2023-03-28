import 'package:doulingo_fake/models/user_model.dart';

class BlogModel {
  String? title, snippet, body, createdAt, updatedAt, idUser;
  UserModel? userModel;
  BlogModel({
    required this.title,
    required this.snippet,
    required this.body,
  });
  BlogModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    snippet = json['snippet'];
    body = json['body'];
    userModel = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['snippet'] = this.snippet;
    data['body'] = this.body;
    return data;
  }
}
