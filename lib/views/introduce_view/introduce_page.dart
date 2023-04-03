
import 'package:doulingo_fake/controllers/bottom_controller.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroducePage extends StatelessWidget {
  const IntroducePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    BottomController bottomController = Get.find();
    return Scaffold(
      body: Stack(children: [
        Container(
          color: Constant.mainColor,
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
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 300.w,
                  height: 30.h,
                  child: Obx(
                    () {
                      bottomController.randomIndicator();
                      return LiquidLinearProgressIndicator(
                        value: bottomController.valueIndicator.value,
                        valueColor: AlwaysStoppedAnimation(Constant.lightBlue),
                        backgroundColor: Constant.white,
                        borderColor: Constant.mainColor,
                        borderWidth: 5,
                        direction: Axis.horizontal,
                        center: Text('Loading...'),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
