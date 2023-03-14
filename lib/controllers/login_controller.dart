import 'package:doulingo_fake/helper/route.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  RxInt age = 21.obs;
  RxInt value = 0.obs;
  void birthday(){
    age.value+=1;
  }


  Future<void> Login() async {
    Get.offAndToNamed(RoutePage.instructionPage);
  }

  void directToSignUp() {
    Get.toNamed(RoutePage.signUpPage);
  }
  
  void checkLogin() async {
    try {
      
    } catch (e) {
      throw Exception(e);
    }
  }

  void onChangeEmail(int valueOnChange){
    value.value = valueOnChange;
    print(value.value);
  }
  
}
