class TypeModel {
  String? id, typeName;
  TypeModel({this.id, this.typeName});
  TypeModel.fromJson(Map<String,dynamic> json){
    id = json['_id'];
    typeName = json['type_name'];
  }

}