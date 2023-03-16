import 'package:doulingo_fake/helper/route.dart';
import 'package:doulingo_fake/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  RxInt age = 21.obs;
  RxInt value = 0.obs;
  RxBool hidePassword = true.obs;
  void birthday() {
    age.value += 1;
  }

  Future<void> Login(UserModel userModel) async {
    if (userModel.isOld == true) {
      Get.offAndToNamed(RoutePage.homePage);
    } else {
      Get.offAndToNamed(RoutePage.instructionPage);
    }
  }

  void directToSignUp() {
    Get.toNamed(RoutePage.signUpPage);
  }

  void checkLogin() async {
    try {} catch (e) {
      throw Exception(e);
    }
  }

  void onChangeEmail(int valueOnChange) {
    value.value = valueOnChange;
    print(value.value);
  }

  void onHandleHidePassword(){
    hidePassword.value = !hidePassword.value; 
  }
}
