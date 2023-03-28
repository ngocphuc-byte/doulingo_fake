import 'dart:ffi';

import 'package:doulingo_fake/bloc/login/login_bloc.dart';
import 'package:doulingo_fake/controllers/login_controller.dart';
import 'package:doulingo_fake/data/provider/blog_provider.dart';
import 'package:doulingo_fake/data/provider/user_provider.dart';
import 'package:doulingo_fake/data/repository/user_repo.dart';
import 'package:doulingo_fake/models/user_model.dart';
import 'package:doulingo_fake/views/login_view/text_field_widget.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constant.dart';

// 238
class BoxLoginWidget extends StatefulWidget {
  BoxLoginWidget(
      {super.key,
      required this.loginController,
      required this.textButton,
      required this.isLogin});

  LoginController loginController;
  String textButton;
  RxBool isLogin;
  @override
  State<BoxLoginWidget> createState() => _BoxLoginWidgetState();
}

class _BoxLoginWidgetState extends State<BoxLoginWidget> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController box1Controller = TextEditingController();
  TextEditingController box2Controller = TextEditingController();
  TextEditingController box3Controller = TextEditingController();
  TextEditingController box4Controller = TextEditingController();

  EmailOTP myauth = EmailOTP();


  final loginBox = Hive.box('login');

  Future<void> _onSaveUser(Map<String, dynamic> account) async {
    if (loginBox.length >= 1) {
      print('has data ${loginBox.length}');
    } else {
      await loginBox.add(account);
    }
  }

  Future<void> _onDeleteUSer() async {
    await loginBox.deleteAt(0);
  }

  void signIn() async {
    Future.delayed(Duration(seconds: 3), (() {
      context.read<LoginBloc>().add(
            SignIn(
              userModel: UserModel(
                username: usernameController.text,
                password: passwordController.text,
              ),
            ),
          );
    }));
  }

  Future<void> signUp() async {
    context.read<LoginBloc>().add(
          SignUp(
            userModel: UserModel(
              username: usernameController.text,
              password: passwordController.text,
              email: emailController.text,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    
  
    if (loginBox.length != 0) {
      usernameController.text = loginBox.getAt(0)['username'];
      passwordController.text = loginBox.getAt(0)['password'];
      signIn();
    }
    return Container(
      alignment: Alignment.topCenter,
      height: 450.h,
      width: double.maxFinite,
      child: Column(
        children: [
          widget.isLogin.value
              ? Lottie.asset('assets/images/login_background.json',
                  width: 200.w, height: 150.h)
              : SizedBox(),
          Container(
            height: widget.isLogin.value ? 280.h : 350.h,
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
                  Obx(
                    () => TextField(
                      controller: passwordController,
                      obscureText: widget.loginController.hidePassword.value,
                      decoration: InputDecoration(
                        label: const Text('Mật khẩu'),
                        filled: true,
                        fillColor: Colors.grey[200],
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 1),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        suffix: GestureDetector(
                            onTap: widget.loginController.onHandleHidePassword,
                            child: widget.loginController.hidePassword.value
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off)),
                      ),
                    ),
                  ),
                  widget.isLogin.value
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
                            suffixIcon: IconButton(
                                onPressed: () async {
                                  myauth.setConfig(
                                    appEmail: 'ngocphuc00002@gmail.com',
                                    appName: 'Email OTP',
                                    userEmail: emailController.text,
                                    otpLength: 4,
                                    otpType: OTPType.digitsOnly,
                                  );
                                  if (await myauth.sendOTP() == true) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Sent successfully')));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text('Sent failure')));
                                  }
                                },
                                icon: Icon(Icons.send)),
                          ),
                        ),
                  widget.isLogin.value
                      ? SizedBox()
                      : SizedBox(
                          height: 50.h,
                          child: Row(
                            children: [
                              Flexible(
                                  child: Container(
                                      padding: EdgeInsets.all(2.sp),
                                      child: TextFieldWidget(
                                        box: box1Controller,
                                      ))),
                              Flexible(
                                  child: Container(
                                      padding: EdgeInsets.all(2.sp),
                                      child: TextFieldWidget(
                                        box: box2Controller,
                                      ))),
                              Flexible(
                                  child: Container(
                                      padding: EdgeInsets.all(2.sp),
                                      child: TextFieldWidget(
                                        box: box3Controller,
                                      ))),
                              Flexible(
                                  child: Container(
                                      padding: EdgeInsets.all(2.sp),
                                      child: TextFieldWidget(
                                        box: box4Controller,
                                      ))),
                            ],
                          ),
                        ),
                  widget.isLogin.value
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
                  BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginLoading) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                backgroundColor: Colors.transparent,
                                content: Center(
                                  child: CircularProgressIndicator(),
                                )));
                      } else if (state is LoginError) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.transparent,
                            content: Text('${state.error}')));
                      } else if (state is LoginLoaded) {
                        widget.loginController.Login(state.userModel);
                      }
                    },
                    child: SizedBox(
                      width: 400.w,
                      height: 50.h,
                      child: Obx(
                        () => ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                              backgroundColor: Constant.mainColor),
                          onPressed: widget.isLogin.value
                              ? () async {
                                  signIn();
                                  // print(loginBox.getAt(0));
                                  // _onDeleteUSer();
                                }
                              : widget.loginController.value.value == 0
                                  ? null
                                  : () async {
                                      if (await myauth.verifyOTP(
                                              otp: box1Controller.text +
                                                  box2Controller.text +
                                                  box3Controller.text +
                                                  box4Controller.text) ==
                                          true) {
                                        signUp();
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Somethings wrong here')));
                                      }
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
