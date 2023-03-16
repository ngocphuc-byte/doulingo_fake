import 'dart:convert';




class PackageModel {
  String? title, id, createdAt, updatedAt;
  List? levels;
  PackageModel(
      {this.id, this.title, this.levels, this.createdAt, this.updatedAt});
  PackageModel.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    title = json['title'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    levels = json['levels'];
  }
}
