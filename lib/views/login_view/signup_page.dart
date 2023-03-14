import 'package:doulingo_fake/controllers/login_controller.dart';
import 'package:doulingo_fake/helper/route.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/views/instruction_view/instuction_page.dart';
import 'package:doulingo_fake/views/login_view/box_login.dart';
import 'package:doulingo_fake/views/login_view/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD6E2EA),
        title: Text(
          'Đăng ký',
          style: GoogleFonts.sourceSans3(
              fontSize: Constant.mediumTextSize,
              color: Constant.mainColor,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Constant.mainColor,
            size: Constant.largeTextSize,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFD6E2EA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(title: 'Đăng ký tài khoản ở đây bạn nhé !!!'),
            BoxLoginWidget(
              loginController: loginController,
              textButton: 'Sign up',
              isLogin: false,
            )
          ],
        ),
      ),
    );
  }
}
