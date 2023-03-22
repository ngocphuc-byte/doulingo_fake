import 'package:doulingo_fake/models/type_model.dart';

class QuestionModel {
  String? id, question;
  TypeModel? type;
  List<OptionModel>? options;
  QuestionModel({this.id, this.question, this.type, this.options});
  QuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    question = json['question'];
    type = json['type'] != null ? TypeModel.fromJson(json['type']) : null;
    if (json['options'] != null) {
      options = <OptionModel>[];
      json['options'].forEach((ele) {
        options!.add(OptionModel.fromJson(ele));
      });
    }
  }
}

class OptionModel {
  String? id, option;
  bool? result;
  OptionModel({this.id, this.option, this.result});
  OptionModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    option = json['option'];
    result = json['result'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['option'] = this.option;
    data['result'] = this.result;
    return data;
  }
}
