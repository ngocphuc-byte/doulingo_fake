import 'dart:convert';

import 'package:doulingo_fake/models/user_model.dart';
import 'package:http/http.dart' as http;
part '../../utils/baseURL.dart';

class UserProvider {
  BaseURL baseURL = BaseURL();
  Future createUserProvider(UserModel userModel) async {
    final url = Uri.parse(baseURL.userSignUpURL);
    final response = await http.post(
      url,
      body: jsonEncode(userModel.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    final result = jsonDecode(response.body);
    if (response.statusCode != 200) {
      print('Error');
    } else {
      if (result.length <= 1) {
        return result['message'];
      } else {
        return UserModel.fromJson(result);
      }
    }
  }

  Future signInUserProvider(UserModel userModel) async {
    final url = Uri.parse(baseURL.userSignInURL);
    final response = await http.post(
      url,
      body: jsonEncode(userModel.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    final result = jsonDecode(response.body);
    if (response.statusCode != 200) {
      print('Error');
    } else {
      if (result.length <= 1) {
        return result['message'];
      } else {
        return UserModel.fromJson(result);
      }
    }
  }
}
