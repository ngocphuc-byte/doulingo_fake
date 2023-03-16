import 'dart:convert';

import 'package:doulingo_fake/data/provider/user_provider.dart';
import 'package:doulingo_fake/models/level_model.dart';
import 'package:doulingo_fake/models/package_model.dart';
import 'package:http/http.dart' as http;

class PackageProvider {
  BaseURL baseURL = BaseURL();
  Future<List<PackageModel>> getAllPackage() async {
       List<PackageModel> packageList = [];
       final url = Uri.parse(baseURL.packageGetAllURL);
       final response = await http.get(url);

       final result = jsonDecode(response.body) as List;
       if(response.statusCode != 200){
        throw Exception();
       } else {
        result.forEach((element) {
          packageList.add(PackageModel.fromJson(element));
        });
        return packageList;
       }
  }
}