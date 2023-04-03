import 'package:doulingo_fake/bloc/login/login_bloc.dart';
import 'package:doulingo_fake/helper/route.dart';
import 'package:doulingo_fake/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  void onHandleHidePassword() {
    hidePassword.value = !hidePassword.value;
  }

//COMMENT : function login and sign up
  Future<void> signUp(BuildContext context,
      {required username, required password, required email}) async {
    context.read<LoginBloc>().add(
          SignUp(
            userModel: UserModel(
              username: username,
              password: password,
              email: email,
            ),
          ),
        );
  }

  void signIn(BuildContext context,
      {required username, required password}) async {
    Future.delayed(Duration(seconds: 3), (() {
      context.read<LoginBloc>().add(
            SignIn(
              userModel: UserModel(
                username: username,
                password: password,
              ),
            ),
          );
    }));
  }

  static final _googleSignIn = GoogleSignIn();
  Future<void> signInGoogle(context) async {
    try {
      final user = await _googleSignIn.signIn();
      if (user == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Sign in failed')));
      }
      context.read<LoginBloc>().add(
            SignInGoogle(
              userModel: UserModel(
                username: user?.displayName,
                email: user?.email,
              ),
            ),
          );
    } catch (err) {
      print(err);
    }
  }
}
