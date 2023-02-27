import 'package:doulingo_fake/controllers/login_controller.dart';
import 'package:doulingo_fake/helper/route.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/views/instruction_view/instuction_page.dart';
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
    // ignore: unused_local_variable
    LoginController loginController = Get.find();
    AnimationController _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    @override
    // ignore: unused_element
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Get.back();
        Get.back();
        _controller.reset();
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFD6E2EA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(title: 'Đăng ký tài khoản ở đây bạn nhé !!!'),
            Container(
              alignment: Alignment.topCenter,
              height: 450.h,
              width: double.maxFinite,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: Lottie.asset('assets/images/signup_logo.json',
                        width: 200.w,
                        height: 100.h,
                        fit: BoxFit.contain,
                        repeat: false),
                  ),
                  Container(
                    height: 300.h,
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.only(left: 30.w, right: 30.w, bottom: 20.h),
                    child: Container(
                      width: 500.w,
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(0, 3),
                              spreadRadius: 4)
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              label: const Text('Tài khoản'),
                              filled: true,
                              fillColor: Colors.grey[200],
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 1),
                              ),
                              prefixIcon: const Icon(Icons.account_circle),
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              label: const Text('Mật khẩu'),
                              filled: true,
                              fillColor: Colors.grey[200],
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 1),
                              ),
                              prefixIcon: const Icon(Icons.lock),
                              suffix: const Icon(Icons.visibility),
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              label: const Text('Email'),
                              filled: true,
                              fillColor: Colors.grey[200],
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 1),
                              ),
                              prefixIcon: const Icon(Icons.email),
                            ),
                          ),
                          SizedBox(
                            width: 400.w,
                            height: 50.h,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  backgroundColor: Constant.mainColor),
                              onPressed: () => showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (context) => Container(
                                  alignment: Alignment.center,
                                  child: Dialog(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Lottie.asset(
                                            'assets/images/signup_success.json',
                                            repeat: false,
                                            controller: _controller,
                                            onLoaded: (p0) {
                                          _controller.duration = p0.duration;
                                          _controller.forward();
                                        }),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              icon: Icon(
                                Icons.login,
                                size: 24.sp,
                              ),
                              label: Text(
                                'Sign up',
                                style: TextStyle(
                                    fontSize: 20.sp, letterSpacing: 2.w),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
