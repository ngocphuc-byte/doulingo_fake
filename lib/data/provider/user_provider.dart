import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:doulingo_fake/models/user_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
part '../../utils/baseURL.dart';

class UserProvider {
  BaseURL baseURL = BaseURL();
  final dio = Dio();
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

  // Future signUpAuthProvider(UserModel userModel) async {
  //   try {
  //     final response = await dio.post(baseURL.userAuthSignUpURL,
  //         data: userModel,
  //         options: Options(headers: {
  //           'Content-Type': 'application/json',
  //           // 'Authorization' : 'Bearer'
  //         }));
  //     if (response.statusCode == 200) {
  //       if (response.data['user'].length == 1) {
  //         return response.data['user']['message'];
  //       }
  //       if (loginBox.length >= 1) {
  //         await loginBox.putAt(0, {
  //           'username': userModel.username,
  //           'password': userModel.password,
  //           'token': response.data['token']
  //         });
  //       } else {
  //         await loginBox.add({
  //           'username': userModel.username,
  //           'password': userModel.password,
  //           'token': response.data['token']
  //         });
  //       }
  //       return UserModel.fromJson(response.data['user']);
  //     } else {
  //       return response.data;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  final loginBox = Hive.box('login');

  Future signInAuthProvider(UserModel userModel, String url) async {
    try {
      final response = await dio.post(url,
          data: userModel,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        if (response.data['user'].length == 1) {
          return response.data['user']['message'];
        }
        if (loginBox.length >= 1) {
          await loginBox.putAt(0, {
            'username': userModel.username,
            'password': userModel.password,
            'token': response.data['token']
          });
        } else {
          await loginBox.add({
            'username': userModel.username,
            'password': userModel.password,
            'token': response.data['token']
          });
        }
        return UserModel.fromJson(response.data['user']);
      } else {
        return response.data;
      }
    } catch (e) {
      print(e);
    }
  }

  Future updateImageProvider({required String image}) async {
    String token = await loginBox.getAt(0)['token'];
    try {
      final response = await dio.post(baseURL.userUpdateImageURL,
          data: {'image': image},
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          }));
      print(response.data);
      return UserModel.fromJson(response.data);
    } catch (e) {
      print(e);
      return e;
    }
  }
}
