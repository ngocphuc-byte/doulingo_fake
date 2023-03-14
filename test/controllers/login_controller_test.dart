import 'package:doulingo_fake/controllers/login_controller.dart';
import 'package:doulingo_fake/helper/route.dart';
import 'package:doulingo_fake/views/login_view/signup_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  test('age must up when i click ', () async {
    //ARRANGE
    LoginController loginController = LoginController();

    //ACT
    loginController.directToSignUp();
    // loginController.birthday();
    // ASSERT
    expect(Get.to(RoutePage.signUpPage), SignUpPage());
  });
}
