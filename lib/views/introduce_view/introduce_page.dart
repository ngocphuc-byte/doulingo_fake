import 'package:doulingo_fake/helper/route.dart';
import 'package:doulingo_fake/views/login_view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroducePage extends StatelessWidget {
  const IntroducePage({super.key});

  void nextPage() async {
    await Future.delayed(
      const Duration(seconds: 5),
      () {
        Get.offAndToNamed(RoutePage.loginPage);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    nextPage();
    return Scaffold(
      body: Stack(children: [
        Container(
          color: Color.fromARGB(255, 3, 32, 78),
          padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Center(
                child: Lottie.asset('assets/images/introduce.json',
                    repeat: true,
                    fit: BoxFit.contain,
                    height: 300.h,
                    width: 300.w),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Lottie.asset('assets/images/mini_introduce.json',
                    repeat: true,
                    fit: BoxFit.contain,
                    height: 100.h,
                    width: 100.w),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: LinearProgressIndicator(),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
