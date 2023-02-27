import 'package:doulingo_fake/helper/route.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Future<void> Login() async {
    Get.offAndToNamed(RoutePage.instructionPage);
  }
  void directToSignUp(){
    Get.toNamed(RoutePage.signUpPage);
  }
  
}