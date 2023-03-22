part of '../data/provider/user_provider.dart';

class BaseURL {
  static String baseURL = 'http://10.0.2.2:3000/api';
  static String userURL = '$baseURL/users';
  static String packageURL = '$baseURL/packages';
  static String questionURL = '$baseURL/questions';
  static String levelURL = '$baseURL/levels';

  String userSignUpURL = '$userURL/create';
  String userSignInURL = '$userURL/checkUser';

  String packageGetAllURL = '$packageURL/getLevels';
  String packageUpdateAllURL = '$levelURL/updateUserLevel';

  String questionGetURL = '$questionURL/';
}
