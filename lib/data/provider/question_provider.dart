import 'dart:convert';

import 'package:doulingo_fake/data/provider/user_provider.dart';
import 'package:doulingo_fake/models/question_model.dart';
import 'package:http/http.dart' as http;

class QuestionProvider {
  BaseURL baseURL = BaseURL();
  Future<QuestionModel> getQuestion(String id) async {
    final url = Uri.parse(baseURL.questionGetURL+id);
    final response = await http.get(url);
    if (response.statusCode != 200) {
      print(response.body);
      throw Exception();
    } else {
      final result = jsonDecode(response.body);
      return QuestionModel.fromJson(result);
    }
  }
}
