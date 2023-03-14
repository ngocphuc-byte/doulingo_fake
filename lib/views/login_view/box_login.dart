import 'dart:ffi';

import 'package:doulingo_fake/controllers/login_controller.dart';
import 'package:doulingo_fake/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constant.dart';

class BoxLoginWidget extends StatefulWidget {
  BoxLoginWidget(
      {super.key,
      required this.loginController,
      required this.textButton,
      required this.isLogin});

  LoginController loginController;
  String textButton;
  bool isLogin;
  @override
  State<BoxLoginWidget> createState() => _BoxLoginWidgetState();
}

class _BoxLoginWidgetState extends State<BoxLoginWidget> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 450.h,
      width: double.maxFinite,
      child: Column(
        children: [
          widget.isLogin
              ? Lottie.asset('assets/images/login_background.json',
                  width: 200.w, height: 150.h)
              : SizedBox(),
          Container(
            height: widget.isLogin ? 280.h : 350.h,
            width: double.maxFinite,
            padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 20.h),
            child: Container(
              width: 500.w,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.sp),
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
                    controller: usernameController,
                    decoration: InputDecoration(
                      label: const Text('Tài khoản'),
                      filled: true,
                      fillColor: Colors.grey[200],
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 1),
                      ),
                      prefixIcon: const Icon(Icons.account_circle),
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      label: const Text('Mật khẩu'),
                      filled: true,
                      fillColor: Colors.grey[200],
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 1),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      suffix: const Icon(Icons.visibility),
                    ),
                  ),
                  widget.isLogin
                      ? SizedBox()
                      : TextField(
                          controller: emailController,
                          onChanged: (value) => widget.loginController
                              .onChangeEmail(value.length),
                          decoration: InputDecoration(
                            label: const Text('Email'),
                            filled: true,
                            fillColor: Colors.grey[200],
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 1),
                            ),
                            prefixIcon: const Icon(Icons.email),
                            suffixIcon: IconButton(onPressed: () {
                              
                            }, icon: Icon(Icons.send)),
                          ),
                        ),
                  widget.isLogin
                      ? SizedBox()
                      : TextField(
                          decoration: InputDecoration(
                            label: const Text('OTP'),
                            filled: true,
                            fillColor: Colors.grey[200],
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 1),
                            ),
                            prefixIcon: const Icon(Icons.security_update),
                          ),
                        ),
                  widget.isLogin
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            child: Text('Đăng ký tại đây bạn nhé',
                                style: TextStyle(
                                    fontSize: Constant.smallTextSize)),
                            onPressed: () {
                              widget.loginController.directToSignUp();
                            },
                          ))
                      : SizedBox(),
                  SizedBox(
                    width: 400.w,
                    height: 50.h,
                    child: Obx(
                      () => ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.sp),
                            ),
                            backgroundColor: Constant.mainColor),
                        onPressed: widget.loginController.value.value == 0
                            ? null
                            : () {
                                widget.isLogin
                                    ? Get.back()
                                    : widget.loginController.Login();
                              },
                        icon: Icon(
                          Icons.login,
                          size: 24.sp,
                        ),
                        label: Text(
                          widget.textButton,
                          style: TextStyle(
                            fontSize: Constant.mediumTextSize,
                            letterSpacing: 2.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
