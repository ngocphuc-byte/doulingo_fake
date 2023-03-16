import 'dart:convert';

import 'package:doulingo_fake/models/user_model.dart';

class LevelModel {
  String? id, dayTask;
  List? users, questions;
  LevelModel({this.id, this.users, this.questions, this.dayTask});

   LevelModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    users = json['user'].cast<String>();
    questions = json['questions'].cast<String>();
    dayTask = json['dayTask'];
  }
  
}