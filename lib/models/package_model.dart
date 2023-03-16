import 'dart:convert';

import 'package:doulingo_fake/models/level_model.dart';

class PackageModel {
  String? title, id, createdAt, updatedAt;
  List<LevelModel>? levels;
  PackageModel(
      {this.id, this.title, this.levels, this.createdAt, this.updatedAt});
 PackageModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    if (json['levels'] != null) {
      levels = <LevelModel>[];
      json['levels'].forEach((v) {
        levels!.add(new LevelModel.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
