import 'package:doulingo_fake/models/user_model.dart';

class BlogModel {
  String? id, title, snippet, body, createdAt, updatedAt, idUser;
  UserModel? userModel;
  BlogModel({
    required this.title,
    required this.snippet,
    required this.body,
    this.id
  });
  BlogModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    snippet = json['snippet'];
    body = json['body'];
    userModel = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['title'] = this.title;
    data['snippet'] = this.snippet;
    data['body'] = this.body;
    return data;
  }
}
