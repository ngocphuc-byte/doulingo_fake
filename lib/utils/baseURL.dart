part of '../data/provider/user_provider.dart';

class BaseURL {
  static String baseURL = 'http://10.0.2.2:3000/api';
  static String userURL = '$baseURL/users';
  static String packageURL = '$baseURL/packages';
  static String questionURL = '$baseURL/questions';
  static String levelURL = '$baseURL/levels';
  static String blogURL = '$baseURL/blogs';

  String userSignUpURL = '$userURL/create';
  String userSignInURL = '$userURL/checkUser';
  String userAuthSignUpURL = '$userURL/signup';
  String userAuthSignInURL = '$userURL/login';
  String userAuthGoogleURL = '$userURL/signinGoogle';
  String userUpdateImageURL = '$userURL/updateImage';

  String packageGetAllURL = '$packageURL/getLevels';
  String packageUpdateAllURL = '$levelURL/updateUserLevel';

  String questionGetURL = '$questionURL/';

  String blogGetURL = '$blogURL/getBlogs';
  String blogCreateURL = '$blogURL/createBlog';
  String blogUpdateURL = '$blogURL/editBlog';
  String blogRemoveURL = '$blogURL/removeBlog';
}
