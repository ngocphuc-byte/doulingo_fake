import 'package:doulingo_fake/controllers/login_controller.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/views/instruction_view/instuction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find();
    return Scaffold(
      backgroundColor: const Color(0xFFD6E2EA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 250.h,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 150.h,
                    width: double.maxFinite,
                    child: Lottie.asset(
                      'assets/images/login_logo.json',
                      repeat: false,
                    ),
                  ),
                  Container(
                    height: 100.h,
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    child: Text(
                      'Hãy đăng nhập và chúng ta sẽ đồng hành cùng nhau bạn nhé !!!',
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              height: 450.h,
              width: double.maxFinite,
              child: Column(
                children: [
                  Lottie.asset('assets/images/login_background.json',
                      width: 200.w, height: 200.h),
                  Container(
                    height: 250.h,
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
                          Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                child: const Text('Đăng ký tại đây bạn nhé'),
                                onPressed: () {},
                              )),
                          SizedBox(
                            width: 400.w,
                            height: 50.h,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  backgroundColor: Constant.mainColor),
                              onPressed: () {
                                loginController.Login();
                              },
                              icon: Icon(
                                Icons.login,
                                size: 24.sp,
                              ),
                              label: Text(
                                'Login',
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
