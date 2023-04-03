import 'package:doulingo_fake/controllers/login_controller.dart';
import 'package:doulingo_fake/data/provider/package_provider.dart';
import 'package:doulingo_fake/data/provider/question_provider.dart';
import 'package:doulingo_fake/models/question_model.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/views/instruction_view/instuction_page.dart';
import 'package:doulingo_fake/views/login_view/box_login.dart';
import 'package:doulingo_fake/views/login_view/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    RxBool isLogin = true.obs;
    return Scaffold(
      backgroundColor: const Color(0xFFD6E2EA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            BoxLoginWidget(
              loginController: loginController,
              textButton: 'Login',
              isLogin: isLogin,
            ),
          ],
        ),
      ),
    );
  }
}
