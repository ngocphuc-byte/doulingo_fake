import 'dart:convert';

import 'package:doulingo_fake/models/user_model.dart';

class LevelModel {
  String? id, dayTask;
  List? idListUsers, listQuestions;
  LevelModel({this.id, this.idListUsers, this.listQuestions, this.dayTask});

  LevelModel.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    dayTask = json['dayTask'];
    if(json['questions'] != null){
      json['questions'].forEach((ele){
        listQuestions?.add(jsonDecode(ele));
      });
    }
  }
  
}